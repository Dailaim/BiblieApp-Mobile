import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

int useDynamicColumns(double desiredItemWidth) {
  final context = useContext();
  final columns = useState<int>(0);

  final width = MediaQuery.of(context).size.width;

  useEffect(() {
    columns.value = (width / desiredItemWidth).floor();
    return null;
  }, [width]);

  return columns.value;
}
