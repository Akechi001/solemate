import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:solemate/Network/firebaseAuthServices.dart';
import 'package:solemate/pages/login.dart';
import 'package:solemate/widgets/customButton.dart';
import 'package:solemate/widgets/customTextField.dart';

// TODO: add more robust error notification
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final _formKey;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Gap(40),
              Text("Selamat Bergabung!", style: TextStyle(fontSize: 32),),
              Text("Silahkan daftar untuk melanjutkan", style: TextStyle(fontSize: 12),),
              const Gap(200),
              Form(
                key: _formKey,
                child: OverflowBar(
                  overflowAlignment: OverflowBarAlignment.center,
                  overflowSpacing: 10,
                  children: [
                    FormFieldWidget(
                      controller: _nameController,
                      labelText: "Name",
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.name,
                      autofillHints: const [AutofillHints.name],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    FormFieldWidget(
                      controller: _emailController,
                      labelText: "Email",
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        }
                        if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Your email format is not valid';
                        }
                        return null;
                      },
                    ),
                    FormFieldWidget(
                      controller: _passwordController,
                      labelText: "Password",
                      prefixIcon: Icons.key,
                      isPassword: true,
                      autofillHints: const [AutofillHints.newPassword],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context)
                            .requestFocus(_confirmPasswordFocusNode);
                      },
                    ),
                    FormFieldWidget(
                      controller: _confirmPasswordController,
                      labelText: "Confirm Password",
                      prefixIcon: Icons.key,
                      focusNode: _confirmPasswordFocusNode,
                      isPassword: true,
                      autofillHints: const [AutofillHints.newPassword],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please reenter your password';
                        }
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        _submitForm();
                      },
                    ),
                    const Gap(0),
                    CustomButton(
                      text: "Buat Akun",
                      onPressed: () {
                        _submitForm();
                      },
                    ),
                  ],
                ),
              ),
              const Gap(14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Sudah punya akun?",
                      style: TextStyle(color: Colors.black)),
                  GestureDetector(
                    onTap: () {
                      // GoRouter.of(context).go('/login');
                    },
                    child: Text(
                      ' Masuk disini',
                      style: TextStyle(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text.trim();
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      try {
        // Memanggil service FirebaseAuth untuk registrasi
        var user = await FirebaseAuthService().signUpWithEmail(email, password);

        // Jika registrasi berhasil, kamu bisa melakukan navigasi atau apa saja setelah registrasi berhasil
        if (user != null) {
          // Biasanya setelah registrasi, kamu ingin mengarahkan pengguna ke halaman login atau halaman utama
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()), // Ganti LoginPage() dengan widget tujuanmu
          );
        }
      } catch (e) {
        // Menampilkan error jika registrasi gagal
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
      }
    }
  }

}
