import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/constansts/color_manger.dart';

class PdfViewScreen extends StatefulWidget {
  const PdfViewScreen({super.key});

  @override
  State<PdfViewScreen> createState() => _PdfViewScreenState();
}

class _PdfViewScreenState extends State<PdfViewScreen> {
  String? _pdfPath;
  bool _isLoading = true;
  int _totalPages = 0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _loadPdf();
  }

  Future<void> _loadPdf() async {
    try {
      final data = await rootBundle.load('assets/files/md-rashedul-islam-resume.pdf');
      final bytes = data.buffer.asUint8List();

      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/md-rashedul-islam-resume.pdf');
      await file.writeAsBytes(bytes, flush: true);

      if (mounted) {
        setState(() {
          _pdfPath = file.path;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load PDF: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      appBar: AppBar(
        title: const Text('Resume'),
        backgroundColor: ColorManager.secondBg,
        foregroundColor: ColorManager.whiteColor,
        elevation: 0,
        actions: [
          if (_totalPages > 0)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Text(
                  'Page ${_currentPage + 1} of $_totalPages',
                  style: const TextStyle(
                    color: ColorManager.textSecondary,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primary,
              ),
            )
          : _pdfPath == null
              ? const Center(
                  child: Text(
                    'Failed to load PDF',
                    style: TextStyle(color: ColorManager.whiteColor),
                  ),
                )
              : PDFView(
                  filePath: _pdfPath!,
                  enableSwipe: true,
                  swipeHorizontal: false,
                  autoSpacing: true,
                  pageFling: true,
                  pageSnap: true,
                  fitPolicy: FitPolicy.BOTH,
                  backgroundColor: ColorManager.background,
                  onRender: (pages) {
                    setState(() {
                      _totalPages = pages!;
                    });
                  },
                  onViewCreated: (PDFViewController controller) {},
                  onPageChanged: (int? page, int? total) {
                    setState(() {
                      _currentPage = page ?? 0;
                    });
                  },
                  onError: (error) {
                    debugPrint('PDF Error: $error');
                  },
                ),
    );
  }
}
