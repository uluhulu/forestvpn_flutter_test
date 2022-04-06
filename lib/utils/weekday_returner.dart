String weekdayReturner(DateTime dateTime) {
  if (dateTime == DateTime.now()) {
    return "Today";
  } else {
    var dif = DateTime.now().compareTo(dateTime);

    return dif == 1 ? "1 day ago" : "$dif days ago";
  }
}
