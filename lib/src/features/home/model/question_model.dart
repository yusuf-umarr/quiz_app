// class QuestionModel{
//   String? qtn;
//   Options? options;


//   QuestionModel(this.qtn, this.options, );

// }

// class Options{

//   String? optionA;
//   String? optionB;
//   String? optionC;
//   String? optionD;

//   Options(this.optionA,this.optionB, this.optionC, this.optionD);

// }



import 'dart:convert';

List<QuestionModel> questionModelFromJson(String str) => List<QuestionModel>.from(json.decode(str).map((x) => QuestionModel.fromJson(x)));

String questionModelToJson(List<QuestionModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuestionModel {
    QuestionModel({
        this.id,
        this.qtn,
        this.option,
    });

    String? id;
    String? qtn;
    Option? option;

    factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
        id: json["id"] == null ? null : json["id"],
        qtn: json["qtn"] == null ? null : json["qtn"],
        option: json["option"] == null ? null : Option.fromJson(json["option"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "qtn": qtn == null ? null : qtn,
        "option": option == null ? null : option!.toJson(),
    };
}

class Option {
    Option({
        this.a,
        this.b,
        this.c,
        this.d,
    });

    String? a;
    String? b;
    String? c;
    String? d;

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        a: json["a"] == null ? null : json["a"],
        b: json["b"] == null ? null : json["b"],
        c: json["c"] == null ? null : json["c"],
        d: json["d"] == null ? null : json["d"],
    );

    Map<String, dynamic> toJson() => {
        "a": a == null ? null : a,
        "b": b == null ? null : b,
        "c": c == null ? null : c,
        "d": d == null ? null : d,
    };
}