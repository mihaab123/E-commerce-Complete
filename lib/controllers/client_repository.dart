import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_app/models/client.dart';

abstract class IClientRepository {
  Future<List<Client>> allClients();

  Future<Client> clientByUuid({required String uuid});

  Future<Client> clientByAuthuid({required String uid});

  Future setClient({required Client client});
}

class ClientRepository extends IClientRepository {
  static CollectionReference _clientsRef =
      FirebaseFirestore.instance.collection('clients');

  @override
  Future<List<Client>> allClients() async {
    QuerySnapshot ref = await _clientsRef.get();

    List<Client> list = ref.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      return Client.fromMap(data);
    }).toList();
    return list;
  }

  @override
  Future<Client> clientByUuid({required String uuid}) async {
    DocumentSnapshot snapshot = await _clientsRef.doc(uuid).get();
    if (snapshot.exists) {
      return Client.fromMap(snapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('No client exists by that id');
    }
  }

  @override
  Future<Client> clientByAuthuid({required String uid}) async {
    QuerySnapshot ref = await _clientsRef.where('authid', isEqualTo: uid).get();

    if (ref.docs.isNotEmpty) {
      Client c = Client.fromMap(ref.docs.first.data() as Map<String, dynamic>);
      return c;
    } else {
      throw Exception('No client exists by that auth uid');
    }
  }

  @override
  Future setClient({required Client client}) async {
    await _clientsRef.doc(client.uuid).set(client.toMap());
  }
}
