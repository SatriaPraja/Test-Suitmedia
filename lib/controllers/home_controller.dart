import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:test_suitmedia/model/user.dart';

class HomeController extends GetxController {
  var name = ''.obs;
  var sentence = ''.obs;
  var selectedUser = ''.obs;

  var users = <User>[].obs;
  var isLoading = false.obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;

  bool isPalindrome(String text) {
    String processedText = text.replaceAll(RegExp(r'\s+'), '').toLowerCase();
    String reversedText = processedText.split('').reversed.join('');
    return processedText == reversedText;
  }

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage.value = 1;
    } else {
      if (currentPage.value > totalPages.value) return;
    }

    isLoading.value = true;

    final response = await http.get(Uri.parse(
        'https://reqres.in/api/users?page=${currentPage.value}&per_page=5'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (isRefresh) {
        users.clear();
      }
      totalPages.value = data['total_pages'];
      users.addAll(
          (data['data'] as List).map((user) => User.fromJson(user)).toList());
      currentPage.value++;
    }

    isLoading.value = false;
  }
}
