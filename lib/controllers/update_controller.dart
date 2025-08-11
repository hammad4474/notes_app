import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UpdateController extends GetxController {
  static UpdateController get to => Get.find();

  var isCheckingForUpdates = false.obs;
  var updateAvailable = false.obs;
  var currentVersion = ''.obs;
  var latestVersion = ''.obs;
  var updateStatus = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeUpdateController();
  }

  void _initializeUpdateController() async {
    // Get current app version
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      currentVersion.value = packageInfo.version;
    } catch (e) {
      currentVersion.value = '1.0.1'; // Fallback version
    }

    // Automatically check for updates after a short delay
    await Future.delayed(const Duration(seconds: 3));
    await checkForPlayStoreUpdates();
  }

  Future<void> checkForPlayStoreUpdates() async {
    try {
      isCheckingForUpdates.value = true;
      updateStatus.value = 'Checking for updates...';

      // Simulate checking Play Store for updates
      // In a real app, you would integrate with Play Store API or your backend
      await Future.delayed(const Duration(seconds: 2));

      // For demo purposes, let's simulate an update being available
      // In production, this would check the actual Play Store version
      final hasUpdate = _simulatePlayStoreUpdateCheck();

      if (hasUpdate) {
        updateAvailable.value = true;
        latestVersion.value = '1.0.2';
        updateStatus.value = 'Update available: ${latestVersion.value}';

        // Automatically show update dialog after a short delay
        await Future.delayed(const Duration(seconds: 1));
        showUpdateDialog();
      } else {
        updateAvailable.value = false;
        updateStatus.value = 'App is up to date';
      }
    } catch (e) {
      updateAvailable.value = false;
      updateStatus.value = 'Failed to check for updates: $e';
    } finally {
      isCheckingForUpdates.value = false;
    }
  }

  // Simulate Play Store update check - replace with real Play Store API call
  bool _simulatePlayStoreUpdateCheck() {
    // For demo: randomly show update available
    // In real app: check Play Store version vs current version
    return DateTime.now().millisecondsSinceEpoch % 5 == 0; // 20% chance
  }

  void showUpdateDialog() {
    Get.dialog(
      PopScope(
        canPop: false, // Prevent closing the dialog
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400, minHeight: 300),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [const Color(0xFF667EEA), const Color(0xFF764BA2)],
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Icon(
                          Icons.system_update,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Expanded(
                        child: Text(
                          'Update Available',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Text(
                        'A new version is available on Play Store!',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Current Version:',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  currentVersion.value,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Latest Version:',
                                  style: TextStyle(color: Colors.white70),
                                ),
                                Text(
                                  latestVersion.value,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Bug fixes and improvements',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                // Actions
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // Close dialog but don't update
                            Get.back();
                            // Show reminder later
                            _scheduleUpdateReminder();
                          },
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Remind Me Later',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Open Play Store for update
                            _openPlayStore();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: const Color(0xFF667EEA),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'Update Now',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openPlayStore() async {
    try {
      // Open Play Store to your app's page
      final url =
          'https://play.google.com/store/apps/details?id=com.hammad.notes_app';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      } else {
        // Fallback: show snackbar with manual instructions
        Get.snackbar(
          'Update Instructions',
          'Please open Play Store and search for "Notes App" to update',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          icon: const Icon(Icons.info, color: Colors.white),
          duration: const Duration(seconds: 5),
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Could not open Play Store. Please update manually.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        icon: const Icon(Icons.error, color: Colors.white),
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    }
  }

  void _scheduleUpdateReminder() {
    // Schedule a reminder to check for updates again later
    Future.delayed(const Duration(hours: 24), () {
      if (!updateAvailable.value) {
        checkForPlayStoreUpdates();
      }
    });

    Get.snackbar(
      'Reminder Set',
      'We\'ll remind you about the update in 24 hours',
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.orange,
      colorText: Colors.white,
      icon: const Icon(Icons.schedule, color: Colors.white),
      duration: const Duration(seconds: 3),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  // Method to manually trigger update check (for testing purposes)
  Future<void> manualCheckForUpdates() async {
    await checkForPlayStoreUpdates();
  }
}
