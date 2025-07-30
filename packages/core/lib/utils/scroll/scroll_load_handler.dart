import 'package:flutter/material.dart';

/// A mixin that provides infinite scroll functionality for controllers
mixin ScrollLoadHandler<T extends StatefulWidget> on State<T> {
  /// Scroll controller for detecting scroll position
  late ScrollController scrollController;

  /// Current page number for pagination
  int scrollPage = 1;

  /// Maximum number of pages available
  int? maxPage;

  /// Whether currently loading more data
  bool isLoadingMore = false;

  /// Whether there are more pages to load
  bool get hasMorePages => maxPage != null && scrollPage < maxPage!;

  /// Callback function to load more data
  Future<void> Function()? onLoadMoreData;

  /// Callback function to update the UI
  void Function()? onUpdateUI;

  /// Initialize scroll controller and listener
  void setupInfiniteScroll({
    required Future<void> Function() loadMoreDataCallback,
    required void Function() updateUICallback,
  }) {
    scrollController = ScrollController();
    onLoadMoreData = loadMoreDataCallback;
    onUpdateUI = updateUICallback;

    scrollController.addListener(_handleScrollLoad);
  }

  /// Handle scroll events and trigger load more when needed
  void _handleScrollLoad() {
    if (!_shouldLoadMore()) return;

    _triggerLoadMore();
  }

  /// Check if we should load more data
  bool _shouldLoadMore() {
    if (isLoadingMore) return false;
    if (!hasMorePages) return false;
    if (scrollController.position.pixels <
        scrollController.position.maxScrollExtent - 200) return false;

    return true;
  }

  /// Trigger loading more data
  void _triggerLoadMore() {
    if (onLoadMoreData == null) return;

    isLoadingMore = true;
    scrollPage++;
    onUpdateUI?.call();

    onLoadMoreData!().then((_) {
      isLoadingMore = false;
      onUpdateUI?.call();
    }).catchError((error) {
      isLoadingMore = false;
      onUpdateUI?.call();
      // Handle error if needed
    });
  }

  /// Reset pagination state
  void resetPagination() {
    scrollPage = 1;
    maxPage = null;
    isLoadingMore = false;
  }

  /// Update max page from API response
  void updateMaxPage(int? maxPageValue) {
    maxPage = maxPageValue ?? 1;
  }

  /// Dispose scroll controller
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
