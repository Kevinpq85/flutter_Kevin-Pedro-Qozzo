import 'package:s_25/model/api/menu_api.dart';
import 'package:s_25/model/menu_model.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'menu_api_test.mocks.dart';

@GenerateMocks([MenuAPI])
void main() {
  group("ContactAPI", () {
    MenuAPI menuAPI = MockMenuAPI();
    test("get all contact", () async {
      when(menuAPI.getAllMenu())
          .thenAnswer((_) async => <Menu>[Menu(id: 1, name: "a")]);
      var contacts = await menuAPI.getAllMenu();
      expect(contacts.isNotEmpty, true);
    });
  });
}
