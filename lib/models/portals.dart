import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/user.dart';
import 'package:flutter_application_1/utils/portal.dart';

class Portal extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? description;
  final String? profileMediaUrl;
  final String? appId;
  final PortalType? type;
  final PortalPrivacy? privacy;
  final bool? isHidden;
  final List<User>? admins;
  final User? owner;
  final User? createdBy;
  final int? createdAt;
  final int? updatedAt;
  final bool? canJoin;
  final bool? isFollower;
  final RequestStatus? followRequestStatus;
  final int? followerCount;
  final bool? isMember;
  final bool? isOwner;
  final bool? isAdmin;
  final MemberRequestStatus? memberRequestStatus;
  final String? membershipStatus;

  const Portal({
    required this.id,
    this.name,
    this.slug,
    this.description,
    this.profileMediaUrl,
    this.appId,
    this.type,
    this.privacy,
    this.isHidden,
    this.admins,
    this.owner,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
    this.canJoin,
    this.isFollower,
    this.followRequestStatus,
    this.followerCount,
    this.isMember,
    this.isOwner,
    this.isAdmin,
    this.memberRequestStatus,
    this.membershipStatus,
  });

  static const empty = Portal(id: '');

  factory Portal.fromJson({
    Map<String, dynamic>? json,
    String? token,
  }) {
    if (json == null) {
      return Portal.empty;
    }

    return Portal(
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      description: json['description'],
      profileMediaUrl: json['profileMediaUrl'],
      appId: json['appId'],
      type: json['type'].runtimeType == String
          ? PortalType.values.byName(json['type'])
          : null,
      privacy: json['privacy'].runtimeType == String
          ? PortalPrivacy.values.byName(json['privacy'])
          : null,
      isHidden: json['isHidden'],
      admins: json['admins'] ?? [],
      owner: User.fromJson(json: json['owner']),
      createdBy: User.fromJson(json: json['createdBy']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      canJoin: json['canJoin'],
      isFollower: json['isFollower'],
      followRequestStatus: json['followRequestStatus'].runtimeType == String
          ? RequestStatus.values.byName(json['followRequestStatus'])
          : null,
      followerCount: json['followerCount'],
      isMember: json['isMember'],
      isOwner: json['isOwner'],
      isAdmin: json['isAdmin'],
      memberRequestStatus: json['memberRequestStatus'].runtimeType == String
          ? MemberRequestStatus.values.byName(json['memberRequestStatus'])
          : null,
      membershipStatus: json['membershipStatus'],
    );
  }

  @override
  List get props => [
        id,
        name,
        slug,
        description,
        profileMediaUrl,
        appId,
        type,
        privacy,
        isHidden,
        admins,
        owner,
        createdBy,
        createdAt,
        updatedAt,
        canJoin,
        isFollower,
        followRequestStatus,
        followerCount,
        isMember,
        isOwner,
        isAdmin,
        memberRequestStatus,
        membershipStatus,
      ];
}

class Filter {
  final int? skip;
  final int? take;

  const Filter({
    this.skip = 0,
    this.take = 0,
  });
}

class PortalsDataModel extends Equatable {
  final int count;
  final Filter? filter;
  final List<Portal> portals;

  const PortalsDataModel({
    required this.count,
    this.filter,
    required this.portals,
  });

  @override
  List get props => [
        count,
        filter,
        portals,
      ];

  static const empty = PortalsDataModel(
    count: 0,
    portals: [],
  );

  PortalsDataModel copyWith({
    int? count,
    Filter? filter,
    List<Portal>? portals,
  }) {
    return PortalsDataModel(
      count: count ?? this.count,
      filter: filter ?? this.filter,
      portals: portals ?? this.portals,
    );
  }

  factory PortalsDataModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    List<dynamic> portalJsonList = json['portals'] ?? [];
    if (portalJsonList.isEmpty) {
      return PortalsDataModel.empty;
    }

    List<Portal> portalsList = [];

    for (var portal in portalJsonList) {
      if (portal['id'] != null) {
        Portal portalItem = Portal.fromJson(
          json: portal,
        );

        portalsList.add(portalItem);
      }
    }

    return PortalsDataModel(
      count: json['count'],
      portals: portalsList,
    );
  }
}
