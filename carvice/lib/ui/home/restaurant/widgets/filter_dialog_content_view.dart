

class FilterDialog extends StatelessWidget {
  final List<FoodResData> dataList;
  final SearchInterface searchInterface;

  const FilterDialog({
    Key? key,
    required this.dataList,
    required this.searchInterface,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Select Filter', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            const SizedBox(height: 16),

            // Filter list
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final item = dataList[index];
                  return FilterTile(
                    data: item,
                    onChanged: (selected) {
                      item.isSelected = selected;
                      searchInterface.onSelectedFilter(item);
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // Confirm Button
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
              ),
              child: const Text('Confirm Selection'),
            ),
          ],
        ),
      ),
    );
  }
}
