String weekdayReturner(DateTime dateTime) {
  if (dateTime == DateTime.now()) {
    return "Today";
  } else {
    var dif = DateTime.now().difference(dateTime).inDays;
    return dif == 1 ? "1 day ago" : "$dif days ago";
  }
}
