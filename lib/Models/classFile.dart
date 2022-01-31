class GenreDetails {
  GenreDetails(
    this.genreId,
    this.genre,
    this.description,
    this.createdBy,
    this.createdByName,
    this.createdOn,
    this.updatedBy,
    this.updatedByName,
    this.updatedOn,
    this.removedBy,
    this.removedByName,
    this.removedOn,
  );
  late final int genreId;
  late final String genre;
  late final String description;
  late final int createdBy;
  late final String createdByName;
  late final String createdOn;
  late final int updatedBy;
  late final String updatedByName;
  late final String updatedOn;
  late final int removedBy;
  late final String removedByName;
  late final String removedOn;

  GenreDetails.fromJson(Map<String, dynamic> json) {
    genreId = json['genreId'];
    genre = json['genre'];
    description = json["description"].toString();
    createdBy = json['createdBy'];
    createdByName = json['createdByName'].toString();

    createdOn = json['createdOn'].toString();

    updatedBy = json['updatedBy'];
    updatedByName = json['updatedByName'].toString();

    updatedOn = json['updatedOn'].toString();

    removedBy = json['removedBy'];
    removedByName = json['removedByName'].toString();

    removedOn = json['removedOn'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['genreId'] = genreId;
    _data['genre'] = genre;
    _data['description'] = description;
    _data['createdBy'] = createdBy;
    _data['createdByName'] = createdByName;
    _data['createdOn'] = createdOn;
    _data['updatedBy'] = updatedBy;
    _data['updatedByName'] = updatedByName;
    _data['updatedOn'] = updatedOn;
    _data['removedBy'] = removedBy;
    _data['removedByName'] = removedByName;
    _data['removedOn'] = removedOn;
    return _data;
  }
}

class VideoDetails {
  VideoDetails(
    this.videoId,
    this.genreIds,
    this.creatorId,
    this.languageId,
    this.createdBy,
    this.updatedBy,
    this.removedBy,
    this.statusId,
    this.genreNames,
    this.creatorName,
    this.language,
    this.createdByName,
    this.updatedByName,
    this.removedByName,
    this.status,
    this.bannerImagePath1,
    this.bannerImagePath2,
    this.description,
    this.title,
    this.tagsList,
    this.channelName,
    this.videoPath,
    this.videoPath1,
    this.subtitlesPath,
    this.createdOn,
    this.updatedOn,
    this.newTags,
    this.removedOn,
  );
  late final int videoId;
  late final String genreIds;
  late final int creatorId;
  late final int languageId;
  late final int createdBy;
  late final int updatedBy;
  late final int removedBy;
  late final int statusId;
  late final String genreNames;
  late final String creatorName;
  late final String language;
  late final String createdByName;
  late final String updatedByName;
  late final String removedByName;
  late final String status;
  late final String bannerImagePath1;
  late final String bannerImagePath2;
  late final String description;
  late final String title;
  late final String tagsList;
  late final String channelName;
  late final String videoPath;
  late final String videoPath1;
  late final String subtitlesPath;
  late final String createdOn;
  late final String updatedOn;
  late final String newTags;
  late final String removedOn;

  VideoDetails.fromJson(Map<String, dynamic> json) {
    videoId = int.tryParse(json["videoId"].toString()) ?? 0;
    genreIds = json['genreIds'].toString();
    creatorId = int.tryParse(json["creatorId"].toString()) ?? 0;
    languageId = int.tryParse(json["languageId"].toString()) ?? 0;
    createdBy = int.tryParse(json["createdBy"].toString()) ?? 0;
    updatedBy = int.tryParse(json["updatedBy"].toString()) ?? 0;
    removedBy = int.tryParse(json["removedBy"].toString()) ?? 0;
    statusId = int.tryParse(json["statusId"].toString()) ?? 0;
    genreNames = json['genreNames'].toString();
    creatorName = json['creatorName'].toString();
    language = json['language'].toString();
    createdByName = json['createdByName'].toString();
    updatedByName = json['updatedByName'].toString();
    removedByName = json['removedByName'].toString();
    status = json['status'].toString();
    bannerImagePath1 = json['bannerImagePath1'].toString();
    bannerImagePath2 = json['bannerImagePath2'].toString();
    description = json['description'].toString();
    title = json['title'].toString();

    channelName = json['channelName'].toString();
    videoPath = json['videoPath'].toString();
    videoPath1 = json['videoPath1'].toString();

    subtitlesPath = json['subtitlesPath'].toString();
    createdOn = json['createdOn'].toString();
    updatedOn = json['updatedOn'].toString();
    newTags = json['newTags'].toString();
    removedOn = json['removedOn'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['videoId'] = videoId;
    _data['genreIds'] = genreIds;
    _data['creatorId'] = creatorId;
    _data['languageId'] = languageId;
    _data['createdBy'] = createdBy;
    _data['updatedBy'] = updatedBy;
    _data['removedBy'] = removedBy;
    _data['statusId'] = statusId;
    _data['genreNames'] = genreNames;
    _data['creatorName'] = creatorName;
    _data['language'] = language;
    _data['createdByName'] = createdByName;
    _data['updatedByName'] = updatedByName;
    _data['removedByName'] = removedByName;
    _data['status'] = status;
    _data['bannerImagePath1'] = bannerImagePath1;
    _data['bannerImagePath2'] = bannerImagePath2;
    _data['description'] = description;
    _data['title'] = title;
    _data['tagsList'] = tagsList;
    _data['channelName'] = channelName;
    _data['videoPath'] = videoPath;
    _data['videoPath1'] = videoPath1;
    _data['subtitlesPath'] = subtitlesPath;
    _data['createdOn'] = createdOn;
    _data['updatedOn'] = updatedOn;
    _data['newTags'] = newTags;
    _data['removedOn'] = removedOn;
    return _data;
  }
}

class CasteDetails {
  CasteDetails(
    this.castcrewLineNo,
    this.name,
    this.imgPath,
    this.castrole,
    this.charcterName,
    this.videoId,
    this.castrolename,
  );
  late final int castcrewLineNo;
  late final String name;
  late final String imgPath;
  late final String castrole;
  late final String charcterName;
  late final int videoId;
  late final String castrolename;

  CasteDetails.fromJson(Map<String, dynamic> json) {
    castcrewLineNo = int.tryParse(json["castcrewLineNo"].toString()) ?? 0;
    name = json['name'].toString();
    imgPath = json['imgPath'].toString();
    castrole = json['castrole'].toString();
    charcterName = json['charcterName'].toString();
    videoId = int.tryParse(json["videoId"].toString()) ?? 0;
    castrolename = json['castrolename'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['castcrewLineNo'] = castcrewLineNo;
    _data['name'] = name;
    _data['imgPath'] = imgPath;
    _data['castrole'] = castrole;
    _data['charcterName'] = charcterName;
    _data['videoId'] = videoId;
    _data['castrolename'] = castrolename;
    return _data;
  }
}
