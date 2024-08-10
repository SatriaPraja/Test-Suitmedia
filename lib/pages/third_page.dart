import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../model/user.dart';

class ThirdPage extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.users.isEmpty) {
          return Center(child: Text('No users found'));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.fetchUsers(isRefresh: true);
          },
          child: ListView.separated(
            itemCount: controller.users.length + 1,
            separatorBuilder: (context, index) => Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(height: 1, color: Colors.grey[400]),
            ),
            itemBuilder: (context, index) {
              if (index < controller.users.length) {
                User user = controller.users[index];
                return Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.avatar),
                    ),
                    title: Text(
                      '${user.firstName} ${user.lastName}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(user.email, style: TextStyle(fontSize: 10)),
                    onTap: () {
                      controller.selectedUser.value =
                          '${user.firstName} ${user.lastName}';
                      Get.back();
                    },
                  ),
                );
              } else {
                if (controller.currentPage.value <=
                    controller.totalPages.value) {
                  controller.fetchUsers();
                  return Center(child: CircularProgressIndicator());
                } else {
                  return SizedBox.shrink();
                }
              }
            },
          ),
        );
      }),
    );
  }
}
