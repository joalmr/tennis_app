import 'package:tennis_app/src/app/tennis/domain/entities/courts_entity.dart';
import 'package:tennis_app/src/app/tennis/domain/repositories/courts_repository.dart';

class CourtsRepositoryMock implements CourtsRepository {
  @override
  Future<List<CourtsEntity>> getCourts() {
    return Future.value([
      const CourtsEntity(
        id: 1,
        name: 'Court 1',
        location: 'Location 1',
        image: 'https://example.com/court1.jpg',
        surfaceType: 'Grass',
        price: 50,
        start: 10,
        startString: '10:00',
        end: 20,
        endString: '20:00',
      ),
      const CourtsEntity(
        id: 2,
        name: 'Court 2',
        location: 'Location 2',
        image: 'https://example.com/court2.jpg',
        surfaceType: 'Clay',
        price: 40,
        start: 15,
        startString: '15:00',
        end: 22,
        endString: '22:00',
      ),
    ]);
  }
}
