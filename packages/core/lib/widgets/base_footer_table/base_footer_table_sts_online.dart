import 'package:core/core.dart';
import 'package:flutter/material.dart';

class BaseFooterTableStsOnline extends StatelessWidget {
  final List<String> perPageOptions;
  final String selectedPerPage;
  final ValueChanged<String> onPerPageChanged;

  final List<String> pageOptions;
  final String selectedPage;
  final ValueChanged<String> onPageChanged;

  final int totalItems;
  final int maxPage;

  final VoidCallback onPreviousPage;
  final VoidCallback onNextPage;

  const BaseFooterTableStsOnline({
    super.key,
    required this.perPageOptions,
    required this.selectedPerPage,
    required this.onPerPageChanged,
    required this.pageOptions,
    required this.selectedPage,
    required this.onPageChanged,
    required this.totalItems,
    required this.maxPage,
    required this.onPreviousPage,
    required this.onNextPage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10.0),
                  const Text("Tampilkan"),
                  const SizedBox(width: 10.0),
                  SizedBox(
                    width: 80.0,
                    child: BaseDropdownButton(
                      sortItem: false,
                      isSearch: false,
                      useBorder: false,
                      itemAsString: (item) => item,
                      items: perPageOptions,
                      value: selectedPerPage,
                      onChanged: (value) => onPerPageChanged(value!),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Text("Item"),
                  const SizedBox(width: 10.0),
                  Text(totalItems.toString()),
                ],
              ),
              // Right section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 10.0),
                  const Text("Halaman"),
                  const SizedBox(width: 10.0),
                  SizedBox(
                    height: 48.0,
                    width: 80.0,
                    child: BaseDropdownButton(
                      sortItem: false,
                      useBorder: false,
                      itemAsString: (item) => item,
                      items: pageOptions,
                      value: selectedPage,
                      onChanged: (value) => onPageChanged(value!),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  const Text("Dari"),
                  const SizedBox(width: 10.0),
                  Text(maxPage.toString()),
                  const SizedBox(width: 10.0),
                  InkWell(
                    onTap: onPreviousPage,
                    child: SvgPicture.asset(
                      MediaRes.icons.chevron.chevronKiri,
                      colorFilter: int.parse(selectedPage) > 1
                          ? ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn,
                            )
                          : const ColorFilter.mode(
                              gray500,
                              BlendMode.srcIn,
                            ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  InkWell(
                    onTap: onNextPage,
                    child: SvgPicture.asset(
                      MediaRes.icons.chevron.chevronKanan,
                      colorFilter: int.parse(selectedPage) < maxPage
                          ? ColorFilter.mode(
                              Theme.of(context).colorScheme.primary,
                              BlendMode.srcIn,
                            )
                          : const ColorFilter.mode(
                              gray500,
                              BlendMode.srcIn,
                            ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
