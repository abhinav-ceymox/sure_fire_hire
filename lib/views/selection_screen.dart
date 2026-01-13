import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sure_fire_hire/utilities/app_color.dart';
import 'package:sure_fire_hire/utilities/text_style.dart';
import 'package:sure_fire_hire/widgets/selection%20tab.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});
  static const String route = '/SelectionScreen';

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: AppColor.textcolor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Back",
          style: AppStyle.semiBold(fontSize: 20, color: AppColor.textcolor),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/notification-02.svg',
              color: AppColor.textcolor,
              width: 30,
              height: 30,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "#124635GDGDG245",
                    style: AppStyle.semiBold(
                      fontSize: 18,
                      color: AppColor.textcolor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: AppColor.secondary,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "1-Oct 2025",
                          style: AppStyle.semiBold(
                            fontSize: 16,
                            color: AppColor.textcolor,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.secondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "Processing",
                        style: AppStyle.medium(
                          fontSize: 14,
                          color: AppColor.bgcolor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Tab Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 0;
                      });
                    },
                    child: SelectionTab(
                      title: 'Customer',
                      isSelected: selectedTab == 0,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      onTap: () {
                        setState(() => selectedTab = 0);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTab = 1;
                      });
                    },
                    child: SelectionTab(
                      title: 'Orders',
                      isSelected: selectedTab == 1,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      onTap: () {
                        setState(() => selectedTab = 1);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Content Area
          Expanded(
            child: selectedTab == 0 ? _buildCustomerTab() : _buildOrdersTab(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Customer Name",
            style: AppStyle.medium(fontSize: 14, color: Colors.grey[600]!),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(
              "John Doe",
              style: AppStyle.medium(fontSize: 16, color: AppColor.textcolor),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Phone Number",
            style: AppStyle.medium(fontSize: 14, color: Colors.grey[600]!),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(
              "+1 234 567 8900",
              style: AppStyle.medium(fontSize: 16, color: AppColor.textcolor),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Email Address",
            style: AppStyle.medium(fontSize: 14, color: Colors.grey[600]!),
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Text(
              "john.doe@example.com",
              style: AppStyle.medium(fontSize: 16, color: AppColor.textcolor),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersTab() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              // Product Image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: Image.network(
                    'https://images.unsplash.com/photo-1581094794329-c8112a89af12?w=200',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.construction,
                        size: 40,
                        color: Colors.grey[600],
                      );
                    },
                  ),
                ),
              ),
              // Product Details
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Excavator - 2.5 Tonne THJKIL",
                        style: AppStyle.semiBold(
                          fontSize: 16,
                          color: AppColor.textcolor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "SKU: Vista Vantage Petrol Lawn Mower",
                        style: AppStyle.regular(
                          fontSize: 12,
                          color: Colors.grey[600]!,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Qty: 1",
                            style: AppStyle.medium(
                              fontSize: 14,
                              color: AppColor.textcolor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
