import 'package:flutter/material.dart';
import 'package:santapan_fe/core/app_assets.dart';
import 'package:santapan_fe/core/color_styles.dart';
import 'package:santapan_fe/core/typography_styles.dart';
import 'package:santapan_fe/pages/personalisasi/preferensi_makanan_page.dart';
import 'package:santapan_fe/widget/button_custom.dart';

class RiwayatPenyakitPage extends StatefulWidget {
  const RiwayatPenyakitPage({super.key});

  @override
  State<RiwayatPenyakitPage> createState() => _RiwayatPenyakitPageState();
}

class _RiwayatPenyakitPageState extends State<RiwayatPenyakitPage> {
  final List<Map<String, dynamic>> diseases = [
    {'name': 'Diabetes', 'selected': false},
    {'name': 'Asam Lambung/GERD', 'selected': false},
    {'name': 'Kolesterol', 'selected': false},
    {'name': 'Asam Urat', 'selected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(AppAssets.arrowLeft,
                        width: 24, height: 24)),
                Text(
                  "Skip",
                  style: TypographyStyles.bold(16, ColorStyles.primary),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Personalisasi Kesehatan Anda",
              style: TypographyStyles.bold(24, ColorStyles.black),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Apakah kamu punya riwayat salah satu dari kondisi berikut? Pilih yang sesuai untuk mendapatkan rekomendasi yang lebih tepat yaa...",
              style: TypographyStyles.regular(16, ColorStyles.black),
              textAlign: TextAlign.start,
            ),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              height: 320,
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListView.builder(
                itemCount: diseases.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          diseases[index]['name'],
                          style: TypographyStyles.medium(14, ColorStyles.black),
                        ),
                        Checkbox(
                          value: diseases[index]['selected'],
                          activeColor: Colors.white,
                          checkColor: ColorStyles.primary,
                          onChanged: (bool? value) {
                            setState(() {
                              diseases[index]['selected'] = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            ButtonCustom(
              label: "Simpan dan Lanjutkan",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreferensiMakananPage(),
                  ),
                );
              },
              isExpand: true,
            ),
            const SizedBox(
              height: 32,
            ),
          ]),
        ),
      ),
    ));
  }
}
