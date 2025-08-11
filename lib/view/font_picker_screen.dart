import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app/controllers/fonts_controller.dart';
import 'package:notes_app/controllers/theme_controller.dart';

class FontPickerScreen extends StatefulWidget {
  const FontPickerScreen({super.key});

  @override
  State<FontPickerScreen> createState() => _FontPickerScreenState();
}

class _FontPickerScreenState extends State<FontPickerScreen>
    with TickerProviderStateMixin {
  final FontsController fontsController = Get.find<FontsController>();
  final ThemeController themeController = Get.find<ThemeController>();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: themeController.backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: themeController.iconColor),
            onPressed: () => Get.back(),
          ),
          title: Text(
            'Choose Font',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: themeController.textColor,
              fontFamily: fontsController.currentFont.value,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value
                    ? Colors.white.withOpacity(0.1)
                    : Colors.black.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'Current: ${fontsController.currentFontOption.displayName}',
                style: TextStyle(
                  fontSize: 14,
                  color: themeController.textColor.withOpacity(0.8),
                  fontFamily: fontsController.currentFont.value,
                ),
              ),
            ),
          ],
        ),
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: SlideTransition(
            position: _slideAnimation,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Search bar
                  Container(
                    decoration: BoxDecoration(
                      color: themeController.cardColor,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: themeController.isDarkMode.value
                              ? Colors.black.withOpacity(0.2)
                              : Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextField(
                      style: TextStyle(
                        color: themeController.textColor,
                        fontFamily: fontsController.currentFont.value,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Search fonts...',
                        hintStyle: TextStyle(
                          color: themeController.textColor.withOpacity(0.6),
                          fontFamily: fontsController.currentFont.value,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: themeController.textColor.withOpacity(0.6),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.all(16),
                      ),
                      onChanged: (value) {
                        // TODO: Implement search functionality
                      },
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Font count header
                  if (fontsController.availableFonts.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: themeController.cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: themeController.textColor.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.font_download,
                            size: 20,
                            color: themeController.textColor.withOpacity(0.7),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${fontsController.availableFonts.length} fonts available',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: themeController.textColor,
                              fontFamily: fontsController.currentFont.value,
                            ),
                          ),
                        ],
                      ),
                    ),

                  const SizedBox(height: 24),

                  // Categories and fonts
                  Expanded(
                    child: fontsController.availableFonts.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.font_download_off,
                                  size: 64,
                                  color: themeController.textColor.withOpacity(
                                    0.5,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No fonts available',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: themeController.textColor,
                                    fontFamily:
                                        fontsController.currentFont.value,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Please check your assets/fonts folder',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: themeController.textColor
                                        .withOpacity(0.7),
                                    fontFamily:
                                        fontsController.currentFont.value,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            itemCount: fontsController.categories.length,
                            itemBuilder: (context, categoryIndex) {
                              final category =
                                  fontsController.categories[categoryIndex];
                              final fontsInCategory = fontsController
                                  .getFontsByCategory(category);

                              // Skip categories with no fonts
                              if (fontsInCategory.isEmpty) {
                                return const SizedBox.shrink();
                              }

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                    child: Text(
                                      '$category (${fontsInCategory.length})',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeController.textColor,
                                        fontFamily:
                                            fontsController.currentFont.value,
                                      ),
                                    ),
                                  ),
                                  ...fontsInCategory.map(
                                    (font) => _buildFontCard(font),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFontCard(FontOption font) {
    final isSelected = font.name == fontsController.currentFont.value;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? (themeController.isDarkMode.value
                  ? Colors.white.withOpacity(0.1)
                  : Colors.black.withOpacity(0.05))
            : themeController.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: isSelected
            ? Border.all(
                color: themeController.isDarkMode.value
                    ? Colors.white.withOpacity(0.3)
                    : Colors.black.withOpacity(0.2),
                width: 2,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: themeController.isDarkMode.value
                ? Colors.black.withOpacity(0.2)
                : Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            fontsController.changeFont(font.name);
            Get.snackbar(
              'Font Changed',
              'Font changed to ${font.displayName}',
              snackPosition: SnackPosition.TOP,
              backgroundColor: themeController.isDarkMode.value
                  ? Colors.white
                  : Colors.black87,
              colorText: themeController.isDarkMode.value
                  ? Colors.black87
                  : Colors.white,
              icon: Icon(
                Icons.font_download,
                color: themeController.isDarkMode.value
                    ? Colors.black87
                    : Colors.white,
              ),
              duration: const Duration(seconds: 2),
              margin: const EdgeInsets.all(16),
              borderRadius: 12,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                // Font preview
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Font name with actual font
                      _buildStyledText(
                        font.displayName,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontName: font.name,
                      ),
                      const SizedBox(height: 8),
                      // Font description with actual font
                      _buildStyledText(
                        font.preview,
                        fontSize: 16,
                        fontName: font.name,
                        opacity: 0.7,
                      ),
                      const SizedBox(height: 12),
                      // Sample text with actual font
                      _buildStyledText(
                        'The quick brown fox jumps over the lazy dog',
                        fontSize: 18,
                        fontName: font.name,
                        opacity: 0.8,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),

                // Selection indicator
                if (isSelected)
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: themeController.isDarkMode.value
                          ? Colors.white
                          : Colors.black87,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      color: themeController.isDarkMode.value
                          ? Colors.black87
                          : Colors.white,
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build styled text with proper font
  Widget _buildStyledText(
    String text, {
    double? fontSize,
    FontWeight? fontWeight,
    String? fontName,
    double opacity = 1.0,
    int? maxLines,
  }) {
    // Try to get font style first
    final fontStyle = fontsController.getFontStyle(
      fontName ?? fontsController.currentFont.value,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: themeController.textColor.withOpacity(opacity),
      height: 1.2,
    );

    if (fontStyle != null) {
      return Text(
        text,
        style: fontStyle,
        maxLines: maxLines,
        overflow: maxLines != null ? TextOverflow.ellipsis : null,
      );
    }

    // Fallback to regular TextStyle
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: themeController.textColor.withOpacity(opacity),
        fontFamily: fontName,
        height: 1.2,
      ),
      maxLines: maxLines,
      overflow: maxLines != null ? TextOverflow.ellipsis : null,
    );
  }
}
