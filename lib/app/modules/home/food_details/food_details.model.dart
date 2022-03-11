class FoodDetails {
  List<Foods>? foods;

  FoodDetails({this.foods});

  FoodDetails.fromJson(Map<String, dynamic> json) {
    if (json['foods'] != null) {
      foods = <Foods>[];
      json['foods'].forEach((v) {
        foods?.add(Foods.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (foods != null) {
      data['foods'] = foods?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Foods {
  String? name;
  int? calories;
  String? fat;
  String? carbohydrates;

  Foods({this.name, this.calories, this.fat, this.carbohydrates});

  Foods.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    calories = json['calories'];
    fat = json['fat'];
    carbohydrates = json['carbohydrates'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['calories'] = calories;
    data['fat'] = fat;
    data['carbohydrates'] = carbohydrates;
    return data;
  }
}
