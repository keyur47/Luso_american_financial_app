// To parse this JSON data, do
//
//     final calendarModel = calendarModelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get.dart';

List<CalendarModel> calendarModelFromJson(String str) => List<CalendarModel>.from(json.decode(str).map((x) => CalendarModel.fromJson(x)));

String calendarModelToJson(List<CalendarModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalendarModel {
  CalendarModel({
    this.id,
    this.date,
    this.dateGmt,
    this.guid,
    this.modified,
    this.modifiedGmt,
    this.slug,
    this.status,
    this.type,
    this.link,
    this.title,
    this.content,
    this.excerpt,
    this.author,
    this.featuredMedia,
    this.commentStatus,
    this.pingStatus,
    this.template,
    this.meta,
    this.tags,
    this.tribeEventsCat,
    this.links,
  });

  int? id;
  DateTime? date;
  String? dateGmt;
  Guid? guid;
  DateTime? modified;
  DateTime? modifiedGmt;
  String? slug;
  String? status;
  String? type;
  String? link;
  Guid? title;
  Content? content;
  Content? excerpt;
  int? author;
  int? featuredMedia;
  String? commentStatus;
  String? pingStatus;
  String? template;
  Meta? meta;
  List<dynamic>? tags;
  List<int>? tribeEventsCat;
  Links? links;

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
        id: json["id"]??0,
        date:   DateTime.parse(json["date"]??""),
        dateGmt:json["date_gmt"]??"",
        guid: Guid.fromJson(json["guid"]??[]),
        modified: DateTime.parse(json["modified"]??DateTime.now()),
        modifiedGmt: DateTime.parse(json["modified_gmt"]??DateTime.now()),
        slug: json["slug"]??"",
        status: json["status"]??"",
        type: json["type"]??"",
        link: json["link"]??"",
        title: Guid.fromJson(json["title"]??[]),
        content: Content.fromJson(json["content"]??[]),
        excerpt: Content.fromJson(json["excerpt"]??[]),
        author: json["author"]??0,
        featuredMedia: json["featured_media"]??0,
        commentStatus: json["comment_status"]??"",
        pingStatus: json["ping_status"]??"",
        template: json["template"]??"",
        meta: Meta.fromJson(json["meta"]??[]),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        tribeEventsCat: List<int>.from(json["tribe_events_cat"].map((x) => x)),
        links: Links.fromJson(json["_links"]??[]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "date_gmt": dateGmt,
        "guid": guid!.toJson(),
        "modified": modified!.toIso8601String(),
        "modified_gmt": modifiedGmt!.toIso8601String(),
        "slug": slug,
        "status": status,
        "type": type,
        "link": link,
        "title": title!.toJson(),
        "content": content!.toJson(),
        "excerpt": excerpt!.toJson(),
        "author": author,
        "featured_media": featuredMedia,
        "comment_status": commentStatus,
        "ping_status": pingStatus,
        "template": template,
        "meta": meta!.toJson(),
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "tribe_events_cat": List<dynamic>.from(tribeEventsCat!.map((x) => x)),
        "_links": links!.toJson(),
      };
}

class Content {
  Content({
    this.rendered,
    this.protected,
  });

  String? rendered;
  bool? protected;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        rendered: json["rendered"]??"",
        protected: json["protected"]??false,
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
        "protected": protected,
      };
}

class Guid {
  Guid({
    this.rendered,
  });

  String? rendered;

  factory Guid.fromJson(Map<String, dynamic> json) => Guid(
        rendered: json["rendered"]??"",
      );

  Map<String, dynamic> toJson() => {
        "rendered": rendered,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.author,
    this.replies,
    this.versionHistory,
    this.predecessorVersion,
    this.wpAttachment,
    this.wpTerm,
    this.curies,
    this.wpFeaturedmedia,
  });

  List<About>? self;
  List<About>? collection;
  List<About>? about;
  List<Author>? author;
  List<Author>? replies;
  List<VersionHistory>? versionHistory;
  List<PredecessorVersion>? predecessorVersion;
  List<About>? wpAttachment;
  List<WpTerm>? wpTerm;
  List<Cury>? curies;
  List<Author>? wpFeaturedmedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        author: List<Author>.from(json["author"].map((x) => Author.fromJson(x))),
        replies: List<Author>.from(json["replies"].map((x) => Author.fromJson(x))),
        versionHistory: List<VersionHistory>.from(json["version-history"].map((x) => VersionHistory.fromJson(x))),
        predecessorVersion: List<PredecessorVersion>.from(json["predecessor-version"].map((x) => PredecessorVersion.fromJson(x))),
        wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
        wpTerm: List<WpTerm>.from(json["wp:term"].map((x) => WpTerm.fromJson(x))),
        curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
        wpFeaturedmedia: json["wp:featuredmedia"] == null ? null : List<Author>.from(json["wp:featuredmedia"].map((x) => Author.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
        "about": List<dynamic>.from(about!.map((x) => x.toJson())),
        "author": List<dynamic>.from(author!.map((x) => x.toJson())),
        "replies": List<dynamic>.from(replies!.map((x) => x.toJson())),
        "version-history": List<dynamic>.from(versionHistory!.map((x) => x.toJson())),
        "predecessor-version": List<dynamic>.from(predecessorVersion!.map((x) => x.toJson())),
        "wp:attachment": List<dynamic>.from(wpAttachment!.map((x) => x.toJson())),
        "wp:term": List<dynamic>.from(wpTerm!.map((x) => x.toJson())),
        "curies": List<dynamic>.from(curies!.map((x) => x.toJson())),
        "wp:featuredmedia": wpFeaturedmedia == null ? null : List<dynamic>.from(wpFeaturedmedia!.map((x) => x.toJson())),
      };
}

class About {
  About({
    this.href,
  });

  String? href;

  factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"]??"",
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Author {
  Author({
    this.embeddable,
    this.href,
  });

  bool? embeddable;
  String? href;

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        embeddable: json["embeddable"]??false,
        href: json["href"]??"",
      );

  Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
      };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  String? name;
  String? href;
  bool? templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
        name: json["name"]??"",
        href: json["href"]??"",
        templated: json["templated"]??false,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "href": href,
        "templated": templated,
      };
}

class PredecessorVersion {
  PredecessorVersion({
    this.id,
    this.href,
  });

  int? id;
  String? href;

  factory PredecessorVersion.fromJson(Map<String, dynamic> json) => PredecessorVersion(
        id: json["id"]??0,
        href: json["href"]??"",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "href": href,
      };
}

class VersionHistory {
  VersionHistory({
    this.count,
    this.href,
  });

  int? count;
  String? href;

  factory VersionHistory.fromJson(Map<String, dynamic> json) => VersionHistory(
        count: json["count"]??0,
        href: json["href"]??"",
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "href": href,
      };
}

class WpTerm {
  WpTerm({
    this.taxonomy,
    this.embeddable,
    this.href,
  });

  String? taxonomy;
  bool? embeddable;
  String? href;

  factory WpTerm.fromJson(Map<String, dynamic> json) => WpTerm(
        taxonomy: json["taxonomy"]??"",
        embeddable: json["embeddable"]??false,
        href: json["href"]??"",
      );

  Map<String, dynamic> toJson() => {
        "taxonomy": taxonomy,
        "embeddable": embeddable,
        "href": href,
      };
}

class Meta {
  Meta({
    this.tribeEventsStatus,
    this.tribeEventsStatusReason,
  });

  String? tribeEventsStatus;
  String? tribeEventsStatusReason;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        tribeEventsStatus: json["_tribe_events_status"]??"",
        tribeEventsStatusReason: json["_tribe_events_status_reason"]??"",
      );

  Map<String, dynamic> toJson() => {
        "_tribe_events_status": tribeEventsStatus,
        "_tribe_events_status_reason": tribeEventsStatusReason,
      };
}
