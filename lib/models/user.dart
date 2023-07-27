import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/models/social_links.dart';

class User extends Equatable {
  final String? id;
  final String? name;
  final String? bio;
  final String? username;
  final String? profileImageUrl;
  final bool? emailVerified;
  final bool? phoneVerified;
  final String? phone;
  final String? email;
  final bool? isOnboarded;
  final List<SocialLinksOutput>? socialLinks;
  final String? gatewayUserId;
  final int? createdAt;
  final int? updatedAt;
  final bool? isFollower;
  final bool? isFollowing;

  const User({
    this.id,
    this.name,
    this.bio,
    this.username,
    this.profileImageUrl,
    this.emailVerified,
    this.phoneVerified,
    this.phone,
    this.email,
    this.isOnboarded,
    this.socialLinks,
    this.gatewayUserId,
    this.createdAt,
    this.updatedAt,
    this.isFollower,
    this.isFollowing,
  });

  static const empty = User();

  factory User.fromJson({
    Map<String, dynamic>? json,
  }) {
    if (json == null) {
      return User.empty;
    }

    return User(
      id: json['id'],
      name: json['name'],
      bio: json['bio'],
      username: json['username'],
      profileImageUrl: json['profileImageUrl'],
      emailVerified: json['emailVerified'],
      phoneVerified: json['phoneVerified'],
      phone: json['phone'],
      email: json['email'],
      isOnboarded: json['isOnboarded'],
      socialLinks: json['socialLinks'] ?? [],
      gatewayUserId: json['gatewayUserId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      isFollower: json['isFollower'],
      isFollowing: json['isFollowing'],
    );
  }

  @override
  List get props => [
        id,
        name,
        bio,
        username,
        profileImageUrl,
        emailVerified,
        phoneVerified,
        phone,
        email,
        isOnboarded,
        socialLinks,
        gatewayUserId,
        createdAt,
        updatedAt,
        isFollower,
        isFollowing,
      ];
}
