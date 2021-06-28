const rootRoute = "/";
const overviewPageDisplayName = "Overview";
const overviewPageRoute = "/overview";

const booksPageDisplayName = "Books";
const booksPageRoute = "/books";

const teachersPageDisplayName = "teachers";
const teachersPageDisplayRoutes = "/teachers";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

const createTeacherPageRoute = "/create/teacher";

class MenuItem{
  final String name;
  final String route;

  MenuItem(this.name, this.route);

}

List<MenuItem> sideMenuItemRoutes = [
  MenuItem(overviewPageDisplayName, overviewPageRoute),
  MenuItem(booksPageDisplayName, booksPageRoute),
  MenuItem(teachersPageDisplayName, teachersPageDisplayRoutes),
  MenuItem(authenticationPageDisplayName, authenticationPageRoute)
];