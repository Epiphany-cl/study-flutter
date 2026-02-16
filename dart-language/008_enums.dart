// 简单的枚举
enum PlanetType { terrestrial, gas, ice }

/// 枚举太阳系中不同行星及其部分属性的枚举类型。
enum Planet {
  mercury(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  venus(planetType: PlanetType.terrestrial, moons: 0, hasRings: false),
  earth(planetType: PlanetType.terrestrial, moons: 1, hasRings: false),
  mars(planetType: PlanetType.terrestrial, moons: 2, hasRings: false),
  jupiter(planetType: PlanetType.gas, moons: 79, hasRings: true),
  saturn(planetType: PlanetType.gas, moons: 82, hasRings: true),
  uranus(planetType: PlanetType.ice, moons: 27, hasRings: true),
  neptune(planetType: PlanetType.ice, moons: 14, hasRings: true);

  /// 常量生成式构造函数
  const Planet({
    required this.planetType,
    required this.moons,
    required this.hasRings,
  });

  /// 所有实例变量均为 final
  final PlanetType planetType;
  final int moons;
  final bool hasRings;

  /// 增强型枚举支持 getter 和其他方法，直接 .isGiant 调用。
  bool get isGiant =>
      planetType == PlanetType.gas || planetType == PlanetType.ice;
}

void main(List<String> args) {
  final yourPlanet = Planet.earth;

  if (!yourPlanet.isGiant) {
    print('Your planet is not a "giant planet".');
  }

  // 代替完整、显式的语法：
  Planet myPlanet = Planet.venus;

  // 可以使用点号简写：
  Planet myPlanet2 = .venus;

  print(myPlanet);
  print(myPlanet2);
}
