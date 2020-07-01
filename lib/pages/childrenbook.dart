import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbooksellingapp/components/single_product.dart';
import 'package:flutterbooksellingapp/models/products.dart';

List<Product> product_children_list = [
  Product(
    id: "12",
    name: "Bố già",
    author: "Mario puzo",
    image: "images/products/p1.jpg",
    old_price: '120,000',
    price: '100,000',
    nxb: 'Tuoi tre',
    description:
        ''' \n    Thế giới ngầm được phản ánh trong tiểu thuyết Bố Già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố Già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc. Từ một kẻ nhập cư tay trắng đến ông trùm tột đỉnh quyền uy, Don Vito Corleone là con rắn hổ mang thâm trầm, nguy hiểm khiến kẻ thù phải kiềng nể, e dè, nhưng cũng được bạn bè, thân quyến xem như một đấng toàn năng đầy nghĩa khí. Nhân vật trung tâm ấy đồng thời cũng là hiện thân của một pho triết lí rất “đời” được nhào nặn từ vốn sống của hàng chục năm lăn lộn giữa chốn giang hồ bao phen vào sinh ra tử, vì thế mà có ý kiến cho rằng “Bố Già là sự tổng hòa của mọi hiểu biết. Bố Già là đáp án cho mọi câu hỏi.

   Với cấu tứ hoàn hảo, cốt truyện không thiếu những pha hành động gay cấn, tình tiết bất ngờ và không khí kình địch đến nghẹt thở, Bố Già xứng đáng là đỉnh cao trong sự nghiệp văn chương của Mario Puzo. Và như một cơ duyên đặc biệt, ngay từ năm 1971-1972, Bố Già đã đến với bạn đọc trong nước qua phong cách chuyển ngữ hào sảng, đậm chất giang hồ của dịch giả Ngọc Thứ Lang.''',
  ),
  Product(
    id: "42",
    name: "One Piece tập 92 ",
    author: "Masashi Kishimoto",
    image: "images/products/manga-comic/op92.jpg",
    old_price: '120,000',
    price: '20,550',
    nxb: 'Tuoi tre',
    description: 'a',
  ),
  Product(
    name: "One Piece tập 92 ",
    author: "Masashi Kishimoto",
    image: "images/products/manga-comic/op92.jpg",
    old_price: '120,000',
    price: '20,550',
    nxb: 'Tuoi tre',
    description: 'a',
  ),
  Product(
    id: "12",
    name: "Bố già",
    author: "Mario puzo",
    image: "images/products/p1.jpg",
    old_price: '120,000',
    price: '100,000',
    nxb: 'Tuoi tre',
    description:
    ''' \n    Thế giới ngầm được phản ánh trong tiểu thuyết Bố Già là sự gặp gỡ giữa một bên là ý chí cương cường và nền tảng gia tộc chặt chẽ theo truyền thống mafia xứ Sicily với một bên là xã hội Mỹ nhập nhằng đen trắng, mảnh đất màu mỡ cho những cơ hội làm ăn bất chính hứa hẹn những món lợi kếch xù. Trong thế giới ấy, hình tượng Bố Già được tác giả dày công khắc họa đã trở thành bức chân dung bất hủ trong lòng người đọc. Từ một kẻ nhập cư tay trắng đến ông trùm tột đỉnh quyền uy, Don Vito Corleone là con rắn hổ mang thâm trầm, nguy hiểm khiến kẻ thù phải kiềng nể, e dè, nhưng cũng được bạn bè, thân quyến xem như một đấng toàn năng đầy nghĩa khí. Nhân vật trung tâm ấy đồng thời cũng là hiện thân của một pho triết lí rất “đời” được nhào nặn từ vốn sống của hàng chục năm lăn lộn giữa chốn giang hồ bao phen vào sinh ra tử, vì thế mà có ý kiến cho rằng “Bố Già là sự tổng hòa của mọi hiểu biết. Bố Già là đáp án cho mọi câu hỏi.

   Với cấu tứ hoàn hảo, cốt truyện không thiếu những pha hành động gay cấn, tình tiết bất ngờ và không khí kình địch đến nghẹt thở, Bố Già xứng đáng là đỉnh cao trong sự nghiệp văn chương của Mario Puzo. Và như một cơ duyên đặc biệt, ngay từ năm 1971-1972, Bố Già đã đến với bạn đọc trong nước qua phong cách chuyển ngữ hào sảng, đậm chất giang hồ của dịch giả Ngọc Thứ Lang.''',
  ),
];

class ChildrenBook extends StatefulWidget {
  @override
  _ChildrenBookState createState() => _ChildrenBookState();
}

class _ChildrenBookState extends State<ChildrenBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        padding: EdgeInsets.all(5),
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height ),
            ),
        itemCount: product_children_list.length,
        itemBuilder: (context, index) {
              return Single_prod_Pages(
              product_ten: product_children_list[index].name,
              product_tacgia: product_children_list[index].author,
              product_picture: product_children_list[index].image,
              product_giacu: product_children_list[index].old_price,
              product_gia: product_children_list[index].price,
              bookObject: product_children_list[index],
            );
        },
      ),
    );
  }
}
