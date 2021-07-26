// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        required this.info,
        required this.item,
        required this.event,
        required this.variable,
    });

    Info info;
    List<WelcomeItem> item;
    List<WelcomeEvent> event;
    List<Variable> variable;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        info: Info.fromJson(json["info"]),
        item: List<WelcomeItem>.from(json["item"].map((x) => WelcomeItem.fromJson(x))),
        event: List<WelcomeEvent>.from(json["event"].map((x) => WelcomeEvent.fromJson(x))),
        variable: List<Variable>.from(json["variable"].map((x) => Variable.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "event": List<dynamic>.from(event.map((x) => x.toJson())),
        "variable": List<dynamic>.from(variable.map((x) => x.toJson())),
    };
}

class WelcomeEvent {
    WelcomeEvent({
        required this.listen,
        required this.script,
    });

    String listen;
    PurpleScript script;

    factory WelcomeEvent.fromJson(Map<String, dynamic> json) => WelcomeEvent(
        listen: json["listen"],
        script: PurpleScript.fromJson(json["script"]),
    );

    Map<String, dynamic> toJson() => {
        "listen": listen,
        "script": script.toJson(),
    };
}

class PurpleScript {
    PurpleScript({
        required this.id,
        required this.type,
        required this.exec,
    });

    String id;
    String type;
    List<String> exec;

    factory PurpleScript.fromJson(Map<String, dynamic> json) => PurpleScript(
        id: json["id"],
        type: json["type"],
        exec: List<String>.from(json["exec"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "exec": List<dynamic>.from(exec.map((x) => x)),
    };
}

class Info {
    Info({
        required this.postmanId,
        required this.name,
        required this.schema,
    });

    String postmanId;
    String name;
    String schema;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        postmanId: json["_postman_id"],
        name: json["name"],
        schema: json["schema"],
    );

    Map<String, dynamic> toJson() => {
        "_postman_id": postmanId,
        "name": name,
        "schema": schema,
    };
}

class WelcomeItem {
    WelcomeItem({
        required this.name,
        required this.item,
        required this.id,
    });

    String name;
    List<PurpleItem> item;
    String id;

    factory WelcomeItem.fromJson(Map<String, dynamic> json) => WelcomeItem(
        name: json["name"],
        item: List<PurpleItem>.from(json["item"].map((x) => PurpleItem.fromJson(x))),
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "item": List<dynamic>.from(item.map((x) => x.toJson())),
        "id": id,
    };
}

class PurpleItem {
    PurpleItem({
        required this.name,
        required this.event,
        required this.id,
        required this.request,
        required this.response,
        required this.protocolProfileBehavior,
        required this.item,
    });

    String name;
    List<ItemEvent> event;
    String id;
    FluffyRequest request;
    List<dynamic> response;
    ProtocolProfileBehavior protocolProfileBehavior;
    List<FluffyItem> item;

    factory PurpleItem.fromJson(Map<String, dynamic> json) => PurpleItem(
       name: json["name"],
        event: json["event"],
        //  == null ? null : List<ItemEvent>.from(json["event"].map((x) => ItemEvent.fromJson(x))),
        id: json["id"],
        request: json["request"],
        //  == null ? null : FluffyRequest.fromJson(json["request"]),
         response: json["response"] ,
        //== null ? null : List<dynamic>.from(json["response"].map((x) => x)),
        // protocolProfileBehavior: json["protocolProfileBehavior"] == null ? null : ProtocolProfileBehavior.fromJson(json["protocolProfileBehavior"]),
         item: json["item"], protocolProfileBehavior:  json["protocolProfileBehavior"]
          // == null ? null : List<FluffyItem>.from(json["item"].map((x) => FluffyItem.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "event": event == null ? null : List<dynamic>.from(event.map((x) => x.toJson())),
        "id": id,
        "request": request == null ? null : request.toJson(),
        "response": response == null ? null : List<dynamic>.from(response.map((x) => x)),
        "protocolProfileBehavior": protocolProfileBehavior == null ? null : protocolProfileBehavior.toJson(),
        "item": item == null ? null : List<dynamic>.from(item.map((x) => x.toJson())),
    };
}

class ItemEvent {
    ItemEvent({
        required this.listen,
        required this.script,
    });

    String listen;
    FluffyScript script;

    factory ItemEvent.fromJson(Map<String, dynamic> json) => ItemEvent(
        listen: json["listen"],
        script: FluffyScript.fromJson(json["script"]),
    );

    Map<String, dynamic> toJson() => {
        "listen": listen,
        "script": script.toJson(),
    };
}

class FluffyScript {
    FluffyScript({
        required this.type,
        required this.exec,
    });

    String type;
    List<String> exec;

    factory FluffyScript.fromJson(Map<String, dynamic> json) => FluffyScript(
        type: json["type"],
        exec: List<String>.from(json["exec"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "exec": List<dynamic>.from(exec.map((x) => x)),
    };
}

class FluffyItem {
    FluffyItem({
        required this.name,
        required this.id,
        required this.request,
        required this.response,
    });

    String name;
    String id;
    PurpleRequest request;
    List<dynamic> response;

    factory FluffyItem.fromJson(Map<String, dynamic> json) => FluffyItem(
        name: json["name"],
        id: json["id"],
        request: PurpleRequest.fromJson(json["request"]),
        response: List<dynamic>.from(json["response"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "request": request.toJson(),
        "response": List<dynamic>.from(response.map((x) => x)),
    };
}

class PurpleRequest {
    PurpleRequest({
        required this.method,
        required this.header,
        this.url,
    });

    Method method;
    List<dynamic> header;
    dynamic url;

    factory PurpleRequest.fromJson(Map<String, dynamic> json) => PurpleRequest(
        method: methodValues.map[json["method"]]!,
        header: List<dynamic>.from(json["header"].map((x) => x)),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "method": methodValues.reverse[method],
        "header": List<dynamic>.from(header.map((x) => x)),
        "url": url,
    };
}

enum Method { POST, PUT, GET, DELETE }

final methodValues = EnumValues({
    "DELETE": Method.DELETE,
    "GET": Method.GET,
    "POST": Method.POST,
    "PUT": Method.PUT
});

class UrlClass {
    UrlClass({
        required this.raw,
        required this.host,
        required this.path,
        required this.query,
        required this.variable,
    });

    String raw;
    List<String> host;
    List<String> path;
    List<Query> query;
    List<Query> variable;

    factory UrlClass.fromJson(Map<String, dynamic> json) => UrlClass(
        raw: json["raw"],
        host: List<String>.from(json["host"].map((x) => x)),
        path: List<String>.from(json["path"].map((x) => x)),
        query: json["query"] ,
        // == null ? null : List<Query>.from(json["query"].map((x) => Query.fromJson(x))),
        variable: json["variable"] ,
        // == null ? null : List<Query>.from(json["variable"].map((x) => Query.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "raw": raw,
        "host": List<dynamic>.from(host.map((x) => x)),
        "path": List<dynamic>.from(path.map((x) => x)),
        "query": query == null ? null : List<dynamic>.from(query.map((x) => x.toJson())),
        "variable": variable == null ? null : List<dynamic>.from(variable.map((x) => x.toJson())),
    };
}

class Query {
    Query({
        required this.key,
        required this.value,
    });

    String key;
    String value;

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        key: json["key"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
    };
}

class ProtocolProfileBehavior {
    ProtocolProfileBehavior({
        required this.disableBodyPruning,
    });

    bool disableBodyPruning;

    factory ProtocolProfileBehavior.fromJson(Map<String, dynamic> json) => ProtocolProfileBehavior(
        disableBodyPruning: json["disableBodyPruning"],
    );

    Map<String, dynamic> toJson() => {
        "disableBodyPruning": disableBodyPruning,
    };
}

class FluffyRequest {
    FluffyRequest({
        required this.method,
        required this.header,
        required this.body,
        this.url,
        required this.auth,
    });

    Method method;
    List<Header> header;
    Body body;
    dynamic url;
    Auth auth;

    factory FluffyRequest.fromJson(Map<String, dynamic> json) => FluffyRequest(
        method: methodValues.map[json["method"]]!,
        header: List<Header>.from(json["header"].map((x) => Header.fromJson(x))),
        body: json["body"],
        //  == null ? null : Body.fromJson(json["body"]),
        url: json["url"],
        auth: json["auth"] 
        // == null ? null : Auth.fromJson(json["auth"]),
    );

    Map<String, dynamic> toJson() => {
        "method": methodValues.reverse[method],
        "header": List<dynamic>.from(header.map((x) => x.toJson())),
        "body": body == null ? null : body.toJson(),
        "url": url,
        "auth": auth == null ? null : auth.toJson(),
    };
}

class Auth {
    Auth({
        required this.type,
        required this.bearer,
    });

    AuthType type;
    Bearer bearer;

    factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        type: authTypeValues.map[json["type"]]!,
        bearer: Bearer.fromJson(json["bearer"]),
    );

    Map<String, dynamic> toJson() => {
        "type": authTypeValues.reverse[type],
        "bearer": bearer.toJson(),
    };
}

class Bearer {
    Bearer({
        required this.token,
    });

    Token token;

    factory Bearer.fromJson(Map<String, dynamic> json) => Bearer(
        token: tokenValues.map[json["token"]]!,
    );

    Map<String, dynamic> toJson() => {
        "token": tokenValues.reverse[token],
    };
}

enum Token { TOKEN }

final tokenValues = EnumValues({
    "{{token}}": Token.TOKEN
});

enum AuthType { BEARER }

final authTypeValues = EnumValues({
    "bearer": AuthType.BEARER
});

class Body {
    Body({
        required this.mode,
        required this.formdata,
        required this.urlencoded,
    });

    Mode mode;
    List<Header> formdata;
    List<Header> urlencoded;

    factory Body.fromJson(Map<String, dynamic> json) => Body(
        mode: modeValues.map[json["mode"]]!,
        formdata: json["formdata"],
        //  == null ? null : List<Header>.from(json["formdata"].map((x) => Header.fromJson(x))),
        urlencoded: json["urlencoded"] 
        // == null ? null : List<Header>.from(json["urlencoded"].map((x) => Header.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "mode": modeValues.reverse[mode],
        "formdata": formdata == null ? null : List<dynamic>.from(formdata.map((x) => x.toJson())),
        "urlencoded": urlencoded == null ? null : List<dynamic>.from(urlencoded.map((x) => x.toJson())),
    };
}

class Header {
    Header({
        required this.key,
        required this.value,
        required this.type,
        required this.description,
    });

    String key;
    String value;
    HeaderType type;
    String description;

    factory Header.fromJson(Map<String, dynamic> json) => Header(
        key: json["key"],
        value: json["value"],
        type: headerTypeValues.map[json["type"]]!,
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "key": key,
        "value": value,
        "type": headerTypeValues.reverse[type],
        "description": description == null ? null : description,
    };
}

enum HeaderType { TEXT }

final headerTypeValues = EnumValues({
    "text": HeaderType.TEXT
});

enum Mode { FORMDATA, URLENCODED }

final modeValues = EnumValues({
    "formdata": Mode.FORMDATA,
    "urlencoded": Mode.URLENCODED
});

class Variable {
    Variable({
        required this.id,
        required this.key,
        required this.value,
        required this.disabled,
    });

    String id;
    String key;
    String value;
    bool disabled;

    factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        id: json["id"],
        key: json["key"],
        value: json["value"],
        disabled: json["disabled"] == null ? null : json["disabled"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
        "disabled": disabled == null ? null : disabled,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

     Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
