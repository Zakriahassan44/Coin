import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Model/coin_model.dart';
import '../../../Provider/favorite_coin_provider.dart';
import 'coin_diagram.dart';

class CoinsDetailScreen extends StatelessWidget {
  final CoinModel coin;

  const CoinsDetailScreen({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              children: [
                _buildCoinImage(context),
                SizedBox(height: 20.h),
                _buildMainInfo(context),
                SizedBox(height: 16.h),
                _buildComposition(context),
                SizedBox(height: 16.h),
                _buildDescriptions(context),
                SizedBox(height: 16.h),
                _buildMintingInfo(context),
                SizedBox(height: 16.h),
                _buildValueAndRarity(context),
                SizedBox(height: 16.h),
                _buildSizeSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      centerTitle: true,
      title: Text(
        "Coin Details",
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      actions: [
        Consumer<FavoriteCoinsProvider>(
          builder: (context, favorite, child) {
            return Padding(
              padding: EdgeInsets.only(right: 12.w),
              child: IconButton(
                onPressed: () => favorite.toggleFavorite(coin, context),
                icon: Icon(
                  favorite.isFavorite(coin)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  size: 24.sp,
                ),
                color: favorite.isFavorite(coin)
                    ? Colors.red
                    : Theme.of(context).colorScheme.onPrimary,
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCoinImage(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 0.45.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10.r,
            offset: Offset(0, 5.h),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: coin.picture.isNotEmpty
            ? Image.network(
          "https://awamisolution.com/coins/picture/${coin.picture}",
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _buildErrorImage(context);
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return _buildLoadingIndicator(context);
          },
        )
            : Image.asset(
          "assets/Images/coina.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMainInfo(BuildContext context) {
    return _buildInfoCard(
      context: context,
      title: coin.title,
      content: Column(
        children: [
          _buildInfoRow(context,"Country", coin.country),
          _buildInfoRow(context,"Years", coin.years),
          _buildInfoRow(context,"Coin Type", coin.coinType),
          _buildInfoRow(context,"Shape", coin.shape),
          _buildInfoRow(context,"Category", coin.category),
          _buildInfoRow(context,"Orientation", coin.orientation),
        ],
      ),
    );
  }

  Widget _buildComposition(BuildContext context) {
    return _buildInfoCard(
      context: context,
      title: "Composition",
      content: _buildDescriptionText(context,coin.composition),
    );
  }

  Widget _buildDescriptions(BuildContext context) {
    return Column(
      children: [
        _buildInfoCard(
          context: context,
          title: "Obverse",
          content: _buildDescriptionText(context,coin.obverse),
        ),
        SizedBox(height: 16.h),
        _buildInfoCard(
          context: context,
          title: "Reverse",
          content: _buildDescriptionText(context,coin.reverse),
        ),
      ],
    );
  }

  Widget _buildMintingInfo(BuildContext context) {
    return _buildInfoCard(
      context: context,
      title: "Minting Information",
      content: Column(
        children: [
          _buildInfoRow(context,"Mint Location", coin.minting),
          _buildInfoRow(context,"Mint Year", coin.years),
          _buildInfoRow(context,"Total Mintage", "1,000,000"),
          _buildInfoRow(context,"Minting Process", "Modern Coinage"),
        ],
      ),
    );
  }

  Widget _buildValueAndRarity(BuildContext context) {
    return Column(
      children: [
        _buildInfoCard(
          context: context,
          title: "Market Value",
          content: _buildDescriptionText(context,coin.marketValue),
        ),
        16. verticalSpace,
        _buildInfoCard(
          context: context,
          title: "Rarity",
          content: _buildDescriptionText(context,coin.rarity),
        ),
      ],
    );
  }

  Widget _buildSizeSection(BuildContext context) {
    return Column(
      children: [
        _buildInfoCard(
          context: context,
          title: "Size Diagram",
          content: const CoinSizeDiagram(
            imagePath: "assets/Images/Coin.png",
          ),
        ),
        16. verticalSpace,
        _buildInfoCard(
          context: context,
          title: "Size Details",
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSizeDetailRow(context,"Size", coin.size),
              _buildSizeDetailRow(context,"Diameter", "${coin.diameters} mm"),
              _buildSizeDetailRow(context,"Thickness", "${coin.thickness} mm"),
              _buildSizeDetailRow(context,"Weight", "${coin.weights} g"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required String title,
    required Widget content,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
          Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          12. verticalSpace,
          content,
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
         8.horizontalSpace,
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              textAlign: TextAlign.left,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildSizeDetailRow(BuildContext context,String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$label: ",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescriptionText(BuildContext context,String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14.sp,
        height: 1.5,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildErrorImage(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 40.sp,
              color: Theme.of(context).colorScheme.primary,
            ),
            8. verticalSpace,
            Text(
              'Image not available',
              style: TextStyle(
                fontSize: 14.sp,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingIndicator(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.tertiary,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}