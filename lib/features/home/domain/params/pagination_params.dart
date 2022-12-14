import 'package:file_manager/app/utilities/constants.dart';

class PaginationParams {
  int? page;
  int? size;

  PaginationParams({
    this.page = 1,
    this.size = Constants.pageSize,
  });
}
