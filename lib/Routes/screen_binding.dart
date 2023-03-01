import 'package:get/get.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Blocks/View/add_blocks.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Houses/View/add_houses.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Add%20Streets/View/add_streets.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Blocks/View/blocks.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Phases/View/phases.dart';
import 'package:societyadminapp/Module/AddSocietyDetail/Streets/View/streets.dart';
import 'package:societyadminapp/Module/Generate%20Bill/View/generate_bill.dart';
import 'package:societyadminapp/Module/Measurements/View/add_measurements.dart';
import 'package:societyadminapp/Module/Splash/View/splash_screen.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/View/resident_verification.dart';
import 'package:societyadminapp/Module/UnVerifiedResidents/View/unverified_residents.dart';

import '../Module/AddEvent/View/add_event.dart';
import '../Module/AddEvent/View/update_event.dart';
import '../Module/AddGateKepeer/View/add_gatekepeer.dart';
import '../Module/AddNoticeBoard/View/add_notice_board_screen.dart';
import '../Module/AddResident/View/add_resident.dart';
import '../Module/AddSocietyDetail/Add Phases/View/add_phases.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildingApartment/View/add_society_building_apartment.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildingFloors/View/add_society_building_floor_screen.dart';
import '../Module/AddSocietyDetail/AddSocietyBuildings/View/add_society__buildings_screen.dart';
import '../Module/AddSocietyDetail/BlocksOrBuildings/View/blocks_or_buildings_screen.dart';
import '../Module/AddSocietyDetail/Houses/View/houses.dart';
import '../Module/AddSocietyDetail/SocietyBuildingApartment/View/society_building_apartment_screen.dart';
import '../Module/AddSocietyDetail/SocietyBuildingFloor/View/society_building_floor_screen.dart';
import '../Module/AddSocietyDetail/SocietyBuildings/View/society_building_screen.dart';
import '../Module/AdminProfile/View/admin_profile_screen.dart';
import '../Module/Events/View/events_screen.dart';
import '../Module/Events/View/view_event_images_screen.dart';
import '../Module/GateKepeer/View/gate_keeper_screen.dart';
import '../Module/GateKepeerDetail/View/gate_keeper_detail_screen.dart';
import '../Module/Generate Bill/View/generated_bill.dart';
import '../Module/HomeScreen/View/home_screen.dart';
import '../Module/ImageHeroView/viewimage.dart';
import '../Module/Login/View/login.dart';
import '../Module/Measurements/View/measurements_view.dart';
import '../Module/NoticeBoard/View/notice_board_screen.dart';
import '../Module/PanicMode/View/panic_mode_screen.dart';
import '../Module/Report Notifications/View/report_notifications_screen.dart';

import '../Module/UpdateGateKeeper/View/updategatekeeper_detail_screen.dart';
import '../Module/UpdateNoticeBoard/View/update_notice_screen.dart';
import '../Module/UserDetail/View/user_detail_screen.dart';
import '../Module/UsersGuestHistory/View/particular_guest_arrival_screen.dart';
import '../Module/UsersGuestHistory/View/users_guest_detail_screen.dart';
import '../Module/UsersGuestHistory/View/users_guest_history_screen.dart';
import '../Module/UsersReportHistory/View/users_report_history_screen.dart';
import '../Module/UsersReportHistory/View/users_reports_history_list_screen.dart';
import '../Module/View Residents/View/view_residents.dart';
import '../Module/ViewReports/View/reported_residents_screen.dart';
import '../Module/ViewReports/View/residents_report_list_screen.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreen());
    Get.lazyPut(() => Login());
    Get.lazyPut(() => HomeScreen());
    Get.lazyPut(() => ViewResidents());
    Get.lazyPut(() => AddResident());
    // Get.lazyPut(() => UpdateResidentDetails());
    Get.lazyPut(() => UserDetailScreen());
    // Get.lazyPut(() => ChatScreen());
    Get.lazyPut(() => GateKeeperScreen());
    Get.lazyPut(() => AddGateKeeper());
    Get.lazyPut(() => UpdateGateKepeerScreen());
    Get.lazyPut(() => GateKepeerDetailScreen());
    Get.lazyPut(() => EventsScreen());
    Get.lazyPut(() => AddEventsScreen());
    Get.lazyPut(() => UpdateEvent());
    Get.lazyPut(() => AdminProfileScreen());
    Get.lazyPut(() => UsersReportsScreen());
    Get.lazyPut(() => UsersReportsHistoryListScreen());
    Get.lazyPut(() => UsersGuestHistorysScreen());
    Get.lazyPut(() => UsersGuestDetailScreen());
    Get.lazyPut(() => ParticularGuestArrivalScreen());
    Get.lazyPut(() => ReportNotificationsScreen());
    Get.lazyPut(() => ReportedResidentListScreen());
    Get.lazyPut(() => UserReportsListScreen());
    Get.lazyPut(() => NoticeBoardScreen());
    Get.lazyPut(() => AddNoticeBoardScreen());
    Get.lazyPut(() => ViewEventImages());
    Get.lazyPut(() => PanicModeScreen());
    Get.lazyPut(() => UpdateNoticeBoardScreen());
    Get.lazyPut(() => ViewImage());
    Get.lazyPut(() => AddPhases());
    Get.lazyPut(() => Phases());
    Get.lazyPut(() => Blocks());
    Get.lazyPut(() => AddBlocks());
    Get.lazyPut(() => Street());
    Get.lazyPut(() => AddStreets());
    Get.lazyPut(() => AddHouses());
    Get.lazyPut(() => Houses());
    Get.lazyPut(() => UnVerifiedResident());

    Get.lazyPut(() => BlockOrBuilding());
    Get.lazyPut(() => SocietyBuildingScreen());
    Get.lazyPut(() => AddSocietyBuildingScreen());
    Get.lazyPut(() => SocietyBuildingFloorsScreen());
    Get.lazyPut(() => AddSocietyBuildingFloors());
    Get.lazyPut(() => SocietyBuildingApartmentScreen());
    Get.lazyPut(() => AddSocietyBuildingApartmentsScreen());



    Get.lazyPut(() => AddMeasurements());
    Get.lazyPut(() => MeasurementView());
    Get.lazyPut(() => ResidentVerification());
    Get.lazyPut(() => GenerateBill());
    Get.lazyPut(() => GeneratedBill());




  }
}
