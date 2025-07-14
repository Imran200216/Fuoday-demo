import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fuoday/commons/widgets/k_text.dart';
import 'package:fuoday/commons/widgets/k_vertical_spacer.dart';
import 'package:fuoday/core/themes/app_colors.dart';
import 'package:graphview/GraphView.dart';

class TeamsTree extends StatefulWidget {
  const TeamsTree({super.key});

  @override
  State<TeamsTree> createState() => _TeamsTreeState();
}

class _TeamsTreeState extends State<TeamsTree> {
  Graph graph = Graph()..isTree = true;
  BuchheimWalkerConfiguration builder = BuchheimWalkerConfiguration();

  @override
  void initState() {
    super.initState();
    setupGraph();
    setupGraphConfiguration();
  }

  void setupGraph() {
    // Create nodes for each employee
    final ceo = Node.Id("ceo");
    final hr = Node.Id("hr");
    final manager = Node.Id("manager");
    final it = Node.Id("it");
    final executive = Node.Id("executive");
    final amazonManager = Node.Id("amazonManager");
    final aiDev1 = Node.Id("aiDev1");
    final projectManager = Node.Id("projectManager");
    final mobileApp = Node.Id("mobileApp");
    final aiDev2 = Node.Id("aiDev2");
    final assistant = Node.Id("assistant");

    // Add nodes to graph
    graph.addNode(ceo);
    graph.addNode(hr);
    graph.addNode(manager);
    graph.addNode(it);
    graph.addNode(executive);
    graph.addNode(amazonManager);
    graph.addNode(aiDev1);
    graph.addNode(projectManager);
    graph.addNode(mobileApp);
    graph.addNode(aiDev2);
    graph.addNode(assistant);

    // Create edges (connections)
    graph.addEdge(ceo, hr);
    graph.addEdge(ceo, manager);
    graph.addEdge(ceo, it);

    graph.addEdge(manager, executive);
    graph.addEdge(manager, amazonManager);

    graph.addEdge(it, aiDev1);
    graph.addEdge(it, projectManager);
    graph.addEdge(it, mobileApp);
    graph.addEdge(it, aiDev2);

    graph.addEdge(amazonManager, assistant);
  }

  void setupGraphConfiguration() {
    builder
      ..siblingSeparation = 80.w.toInt()
      ..levelSeparation = 100.h.toInt()
      ..subtreeSeparation = 120.w.toInt()
      ..orientation = BuchheimWalkerConfiguration.ORIENTATION_TOP_BOTTOM;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          KVerticalSpacer(height: 20.h),

          // Graph View Container
          SizedBox(
            height: 600.h,
            child: InteractiveViewer(
              constrained: false,
              boundaryMargin: EdgeInsets.all(50.w),
              minScale: 0.5,
              maxScale: 2.0,
              child: GraphView(
                graph: graph,
                algorithm: BuchheimWalkerAlgorithm(
                  builder,
                  TreeEdgeRenderer(builder),
                ),
                paint: Paint()
                  ..color = AppColors.subTitleColor
                  ..strokeWidth = 1.5.w
                  ..style = PaintingStyle.stroke,
                builder: (Node node) {
                  return buildEmployeeCard(node.key?.value as String);
                },
              ),
            ),
          ),

          KVerticalSpacer(height: 20.h),
        ],
      ),
    );
  }

  Widget buildEmployeeCard(String employeeId) {
    final employee = getEmployeeData(employeeId);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.subTitleColor, width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        width: 120.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Person Avatar with Error Handling
            CircleAvatar(
              radius: 25.r,
              backgroundColor: employee['avatarColor'],
              child: employee['hasImage']
                  ? ClipOval(
                      child: Image.network(
                        employee['imageUrl'],
                        width: 50.r,
                        height: 50.r,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          // Fallback to icon if image fails to load
                          return Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30.sp,
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return SizedBox(
                            width: 50.r,
                            height: 50.r,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.w,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Icon(Icons.person, color: Colors.white, size: 30.sp),
            ),

            SizedBox(height: 6.h),

            // Person Name
            KText(
              text: employee['name'],
              fontWeight: FontWeight.w600,
              fontSize: 10.sp,
              color: AppColors.titleColor,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 3.h),

            // Person Role
            KText(
              text: employee['position'],
              fontWeight: FontWeight.w600,
              fontSize: 8.sp,
              color: AppColors.greyColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Map<String, dynamic> getEmployeeData(String employeeId) {
    final employeeData = {
      'ceo': {
        'name': 'Krishnakanth ST',
        'position': 'FOUNDER & CEO',
        'avatarColor': AppColors.primaryColor,
        'hasImage': true,
        'imageUrl':
            "https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
      'hr': {
        'name': 'Aysha Begam',
        'position': 'HR',
        'avatarColor': Colors.pink[400],
        'hasImage': true,
        'imageUrl':
            "https://images.unsplash.com/photo-1481214110143-ed630356e1bb?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
      'manager': {
        'name': 'Ishwarya K',
        'position': 'ASSISTANT MANAGER - CC & BANKING',
        'avatarColor': Colors.purple[400],
        'hasImage': true,
        'imageUrl':
            "https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
      'it': {
        'name': 'Saravanan S',
        'position': 'INFORMATION TECHNOLOGY',
        'avatarColor': AppColors.greyColor,
        'hasImage': false, // Changed to false to avoid network issues
        'imageUrl': '',
      },
      'executive': {
        'name': 'Revathi',
        'position': 'SENIOR EXECUTIVE',
        'avatarColor': AppColors.greyColor,
        'hasImage': false,
        'imageUrl': '',
      },
      'amazonManager': {
        'name': 'Sri Vidhya',
        'position': 'ASSISTANT MANAGER AMAZON',
        'avatarColor': AppColors.greyColor,
        'hasImage': false,
        'imageUrl': '',
      },
      'aiDev1': {
        'name': 'Vimal Raj L',
        'position': 'AI DEVELOPER',
        'avatarColor': Colors.pink[400],
        'hasImage': true,
        'imageUrl':
            "https://images.unsplash.com/photo-1499996860823-5214fcc65f8f?q=80&w=766&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      },
      'projectManager': {
        'name': 'Easwarraj B',
        'position': 'PROJECT MANAGER-IT',
        'avatarColor': AppColors.greyColor,
        'hasImage': false,
        'imageUrl': '',
      },
      'mobileApp': {
        'name': 'Mohamed Irfan',
        'position': 'MOBILE APP DEVELOPER',
        'avatarColor': AppColors.greyColor,
        'hasImage': false,
        'imageUrl': '',
      },
      'aiDev2': {
        'name': 'Karkuvel Raja',
        'position': 'AI DEVELOPER',
        'avatarColor': AppColors.greyColor,
        'hasImage': false,
        'imageUrl': '',
      },
      'assistant': {
        'name': 'Assistant',
        'position': 'ASSISTANT',
        'avatarColor': AppColors.greyColor,
        'hasImage': false,
        'imageUrl': '',
      },
    };

    return employeeData[employeeId] ??
        {
          'name': 'Unknown',
          'position': 'Unknown',
          'avatarColor': AppColors.greyColor,
          'hasImage': false,
          'imageUrl': '',
        };
  }
}
