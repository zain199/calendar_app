import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';

class MainLayoutWidget extends StatelessWidget {
  final Widget widget;
  final Color? backGroundColor;
  final ScrollController? scrollController;
  final double? minHeight;
  final bool isScrollable;
  final Future Function()? onRefresh;
  final double heightMargin;
  final double widthMargin;
  final Widget? drawer;
  final Widget? appBar;
  final Future<bool> Function()? onWillPop;
  final bool isSafeArea;
  final SystemUiOverlayStyle systemUiOverlayColor;
  final double? maxHeight;
  final Widget? backgroundWidget;
  final Widget? floatingButton;
  final bool extendBodyBehindAppBar;
  final bool? withoutAppbar;
  final bool? withoutDrawer;
  final Widget? bottomNavigationBar;


  const MainLayoutWidget({
    Key? key,
    required this.widget,
    this.backGroundColor,
    this.bottomNavigationBar,
    this.scrollController,
    this.minHeight,
    this.withoutDrawer,
    this.maxHeight,
    this.withoutAppbar,
    this.isScrollable = true,
    this.heightMargin = 12.0,
    this.widthMargin = 12.0,
    this.drawer,
    this.appBar,
    this.onWillPop,
    this.isSafeArea = true,
    this.systemUiOverlayColor = SystemUiOverlayStyle.dark,
    this.onRefresh,
    this.backgroundWidget,
    this.extendBodyBehindAppBar = false,
    this.floatingButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayColor);
    SizeConfig().init(context);
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      )),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: WillPopScope(
          onWillPop: onWillPop,
          child: Scaffold(
            appBar: appBar!=null? PreferredSize(
                preferredSize: const Size.fromHeight(60),
              child: appBar!,
            ):null,
            drawer: withoutDrawer == null ? const Drawer() : null,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            floatingActionButton: floatingButton,
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: bottomNavigationBar,
            backgroundColor: backGroundColor ?? Get.theme.colorScheme.surface,
            //backGroundColor,
            body: backgroundWidget != null
                ? Stack(
                    children: [
                      backgroundWidget!,

                      IsScrollable(
                        maxHeight: maxHeight,
                        onRefresh: onRefresh,
                        scrollController: scrollController,
                        minHeight: minHeight,
                        widthMargin: widthMargin,
                        heightMargin: heightMargin,
                        widget: widget,
                        isSafeArea: isSafeArea,
                        isScrollable: isScrollable,
                      ),
                    ],
                  )
                : IsScrollable(
                    maxHeight: maxHeight,
                    onRefresh: onRefresh,
                    scrollController: scrollController,
                    minHeight: minHeight,
                    widthMargin: widthMargin,
                    heightMargin: heightMargin,
                    widget: widget,
                    isSafeArea: isSafeArea,
                    isScrollable: isScrollable,
                  ),
          ),
        ),
      ),
    );
  }
}

class IsScrollable extends StatelessWidget {
  const IsScrollable({
    Key? key,
    required this.scrollController,
    required this.minHeight,
    required this.widthMargin,
    required this.heightMargin,
    required this.widget,
    required this.isSafeArea,
    required this.isScrollable,
    required this.onRefresh,
    required this.maxHeight,
  }) : super(key: key);

  final bool isScrollable;
  final ScrollController? scrollController;
  final double? minHeight;
  final double widthMargin;
  final double heightMargin;
  final Widget widget;
  final bool isSafeArea;
  final Future Function()? onRefresh;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    if (isScrollable) {
      return onRefresh != null
          ? RefreshIndicator(
              onRefresh: onRefresh!,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                controller: scrollController,
                child: MainBodyWidget(
                  maxHeight: maxHeight,
                  minHeight: minHeight,
                  widthMargin: widthMargin,
                  heightMargin: heightMargin,
                  widget: widget,
                  isSafeArea: isSafeArea,
                ),
              ),
            )
          : SingleChildScrollView(
              padding: EdgeInsets.zero,
              controller: scrollController,
              child: MainBodyWidget(
                maxHeight: maxHeight,
                minHeight: minHeight,
                widthMargin: widthMargin,
                heightMargin: heightMargin,
                widget: widget,
                isSafeArea: isSafeArea,
              ),
            );
    } else {
      return MainBodyWidget(
        maxHeight: maxHeight,
        minHeight: minHeight,
        widthMargin: widthMargin,
        heightMargin: heightMargin,
        widget: widget,
        isSafeArea: isSafeArea,
      );
    }
  }
}

class MainBodyWidget extends StatelessWidget {
  const MainBodyWidget({
    Key? key,
    required this.minHeight,
    required this.widthMargin,
    required this.heightMargin,
    required this.widget,
    required this.isSafeArea,
    required this.maxHeight,
  }) : super(key: key);

  final double? minHeight;
  final double widthMargin;
  final double heightMargin;
  final Widget widget;
  final bool isSafeArea;
  final double? maxHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints(
      //   minHeight: minHeight ?? SizeConfig.screenHeight,
      //   maxHeight: maxHeight ?? SizeConfig.screenHeight,
      // ),
      margin: EdgeInsets.symmetric(
        horizontal: widthMargin,
      ),
      padding: EdgeInsets.symmetric(
        vertical: heightMargin,
      ),
      width: SizeConfig.screenWidth,
      child: isSafeArea
          ? SafeArea(
              child: widget,
            )
          : widget,
    );
  }
}
