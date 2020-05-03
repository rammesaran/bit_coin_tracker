class BitcoinModel {
  double ask;
  double bid;
  double last;
  double high;
  double low;
  double volume;
  Open open;
  Averages averages;
  Changes changes;
  double volumePercent;
  int timestamp;
  String displayTimestamp;
  String displaySymbol;

  BitcoinModel(
      {this.ask,
      this.bid,
      this.last,
      this.high,
      this.low,
      this.volume,
      this.open,
      this.averages,
      this.changes,
      this.volumePercent,
      this.timestamp,
      this.displayTimestamp,
      this.displaySymbol});

  BitcoinModel.fromJson(Map<String, dynamic> json) {
    ask = json['ask'];
    bid = json['bid'];
    last = json['last'];
    high = json['high'];
    low = json['low'];
    volume = json['volume'];
    open = json['open'] != null ? new Open.fromJson(json['open']) : null;
    averages = json['averages'] != null
        ? new Averages.fromJson(json['averages'])
        : null;
    changes =
        json['changes'] != null ? new Changes.fromJson(json['changes']) : null;
    volumePercent = json['volume_percent'];
    timestamp = json['timestamp'];
    displayTimestamp = json['display_timestamp'];
    displaySymbol = json['display_symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ask'] = this.ask;
    data['bid'] = this.bid;
    data['last'] = this.last;
    data['high'] = this.high;
    data['low'] = this.low;
    data['volume'] = this.volume;
    if (this.open != null) {
      data['open'] = this.open.toJson();
    }
    if (this.averages != null) {
      data['averages'] = this.averages.toJson();
    }
    if (this.changes != null) {
      data['changes'] = this.changes.toJson();
    }
    data['volume_percent'] = this.volumePercent;
    data['timestamp'] = this.timestamp;
    data['display_timestamp'] = this.displayTimestamp;
    data['display_symbol'] = this.displaySymbol;
    return data;
  }
}

class Open {
  double hour;
  double day;
  double week;
  double month;
  double month3;
  double month6;
  double year;

  Open(
      {this.hour,
      this.day,
      this.week,
      this.month,
      this.month3,
      this.month6,
      this.year});

  Open.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    day = json['day'];
    week = json['week'];
    month = json['month'];
    month3 = json['month_3'];
    month6 = json['month_6'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['day'] = this.day;
    data['week'] = this.week;
    data['month'] = this.month;
    data['month_3'] = this.month3;
    data['month_6'] = this.month6;
    data['year'] = this.year;
    return data;
  }
}

class Averages {
  double day;
  double week;
  double month;

  Averages({this.day, this.week, this.month});

  Averages.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    week = json['week'];
    month = json['month'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['week'] = this.week;
    data['month'] = this.month;
    return data;
  }
}

class Changes {
  Price price;
  Price percent;

  Changes({this.price, this.percent});

  Changes.fromJson(Map<String, dynamic> json) {
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    percent =
        json['percent'] != null ? new Price.fromJson(json['percent']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.price != null) {
      data['price'] = this.price.toJson();
    }
    if (this.percent != null) {
      data['percent'] = this.percent.toJson();
    }
    return data;
  }
}

class Price {
  double hour;
  double day;
  double week;
  double month;
  double month3;
  double month6;
  double year;

  Price(
      {this.hour,
      this.day,
      this.week,
      this.month,
      this.month3,
      this.month6,
      this.year});

  Price.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    day = json['day'];
    week = json['week'];
    month = json['month'];
    month3 = json['month_3'];
    month6 = json['month_6'];
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hour'] = this.hour;
    data['day'] = this.day;
    data['week'] = this.week;
    data['month'] = this.month;
    data['month_3'] = this.month3;
    data['month_6'] = this.month6;
    data['year'] = this.year;
    return data;
  }
}