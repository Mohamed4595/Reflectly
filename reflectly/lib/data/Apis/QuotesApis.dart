import 'package:reflectly/data/models/DailyQuotesModel.dart';
import 'package:reflectly/data/models/QuotModel.dart';

List<DailyQuotesModel> getQuotesApi() {
  List<DailyQuotesModel> response = [];
  response.add(DailyQuotesModel(
      dayNumber: "01",
      fullDayName: "Wednesday",
      shortDayName: "Wed",
      fullDate: "DECEMBER 1",
      quot: QuotModel(
          title: "Wisdom",
          subTitle: "Every Wednesday, open your mind",
          question: "message ----------------- !",
          quotImageUrl:
              "https://images.pexels.com/photos/716398/pexels-photo-716398.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
          quot: "Act as if what you do makes a difference. It does."
          "\n– William James",
          smallImageUrl:
              "https://i.pinimg.com/originals/fa/73/2c/fa732c8337bd12e1dde6dee0607d72cb.png")));

  response.add(DailyQuotesModel(
      dayNumber: "02",
      fullDayName: "Thursday",
      shortDayName: "Thu",
      fullDate: "DECEMBER 2",
      quot: QuotModel(
          title: "Truth",
          subTitle: "Every Thursday, speak your truth",
          question: "message ----------------- !",
          quotImageUrl:
          "https://images.unsplash.com/photo-1487088678257-3a541e6e3922?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxOTc3MzAyfHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
          quot:  "Believe you can and you're halfway there."
          "\n– Theodore Roosevelt",
          smallImageUrl:
          "https://ak.picdn.net/shutterstock/videos/18472012/thumb/12.jpg")));

  response.add(DailyQuotesModel(
      dayNumber: "03",
      fullDayName: "Friday",
      shortDayName: "Fri",
      fullDate: "DECEMBER 3",
      quot: QuotModel(
          title: "Identity",
          subTitle: "Every Friday, reflect on who you are",
          question: "message ----------------- !",
          quotImageUrl:
          "https://i.pinimg.com/236x/94/88/9b/94889b9dba01798a81eef8168fe0e072.jpg",
          quot: "Life is like riding a bicycle. To keep your balance, you must keep moving."
          "\n– Albert Einstein",
          smallImageUrl:
          "https://upload.wikimedia.org/wikipedia/commons/d/dd/Small_flowers_%285371688781%29.jpg")));

  response.add(DailyQuotesModel(
      dayNumber: "04",
      fullDayName: "Saturday",
      shortDayName: "Sat",
      fullDate: "DECEMBER 4",
      quot: QuotModel(
          title: "Favorites",
          subTitle: "Every Saturday, share your favorite things",
          question: "message ----------------- !",
          quotImageUrl:
          "https://85ideas.com/wp-content/uploads/2015/10/inspirational-quotes-desktop-wallpapers-1024x576.jpg",
          quot: "You are never too old to set another goal or to dream a new dream."
          "\n– C.S. Lewis",
          smallImageUrl:
          "https://freerangestock.com/sample/23979/small-flowers.jpg")));

  response.add(DailyQuotesModel(
      dayNumber: "05",
      fullDayName: "Sunday",
      shortDayName: "Sun",
      fullDate: "DECEMBER 5",
      quot: QuotModel(
          title: "Gratitude",
          subTitle: "Every Sunday, practice thankfulness",
          question: "message ----------------- !",
          quotImageUrl:
          "https://anime.houseart.me/wp-content/uploads/2020/05/Latest-Top-10-Beautiful-Inspirational-Quotes-Background-for-iPhone-XS.jpg",
          quot: "It is never too late to be what you might have been."
         "\n– George Eliot",
          smallImageUrl:
          "https://ak.picdn.net/shutterstock/videos/18472012/thumb/12.jpg")));

  response.add(DailyQuotesModel(
      dayNumber: "06",
      fullDayName: "Monday",
      shortDayName: "Mon",
      fullDate: "DECEMBER 1",
      quot: QuotModel(
          title: "Celebration",
          subTitle: "Every Monday, celebrate the small things",
          question: "message ----------------- !",
          quotImageUrl:
          "https://images.unsplash.com/photo-1519002606776-ca1939912e8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MTB8MTk3NzMwMnx8ZW58MHx8fHw%3D&w=1000&q=80",
          quot: "Some people look for a beautiful place. Others make a place beautiful."
          "\n– Hazrat Inayat Khan",
          smallImageUrl:
          "https://images.all-free-download.com/images/graphiclarge/beautiful_small_flowers_vector_4_155811.jpg")));

  response.add(DailyQuotesModel(
      dayNumber: "07",
      fullDayName: "Tuesday",
      shortDayName: "Tue",
      fullDate: "DECEMBER 7",
      quot: QuotModel(
          title: "Motivation",
          subTitle: "Every Tuesday, motivate yourself",
          question: "message ----------------- !",
          quotImageUrl:
          "https://images.unsplash.com/photo-1490237251747-4557595144b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxMDcxMTcwfHxlbnwwfHx8fA%3D%3D&w=1000&q=80",
          quot: "We must be willing to let go of the life we planned so as to have the life that is waiting for us."
          "\n– Joseph Campbell",
          smallImageUrl:
          "https://i.ytimg.com/vi/de7oJlq9VR0/maxresdefault.jpg")));

  return response;
}
