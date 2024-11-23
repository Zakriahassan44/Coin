import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Model/artical_model.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final Article artical;

  const ArticleDetailsScreen({
    super.key,
    required this.artical,
  });

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Article Details",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Container
                Container(
                  width: double.infinity,
                  height: 0.3.sh,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10.r,
                        offset: Offset(0, 5.h),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: widget.artical.picture != null &&
                            widget.artical.picture!.isNotEmpty
                        ? Image.network(
                            Uri.encodeFull(
                              'https://awamisolution.com/coins/api/coinsarticle/picture/${widget.artical.picture}',
                            ),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.error_outline,
                                      size: 40.sp,
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                    ),
                                    8.verticalSpace,
                                    Text(
                                      'Image not available',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )
                        : Icon(
                            Icons.image_not_supported,
                            size: 50.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                  ),
                ),
                24.verticalSpace,
                _buildInfoSection(
                  title: "Title",
                  content: widget.artical.title ?? 'No Title',
                ),
                16.verticalSpace,
                // Published Date Section
                _buildInfoSection(
                  title: "Published",
                  content: widget.artical.published ?? 'No Date Available',
                ),
                16.verticalSpace,
                _buildInfoSection(
                  title: "Description",
                  content: widget.artical.description ?? 'No Description',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoSection({
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            content,
            style: TextStyle(
              fontSize: 16.sp,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
