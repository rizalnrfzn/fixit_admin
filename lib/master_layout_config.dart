import 'package:flutter/material.dart';
import 'package:fixit_admin/app_router.dart';
import 'package:fixit_admin/l10n/l10n.dart';
import 'package:fixit_admin/views/widgets/portal_master_layout/portal_master_layout.dart';
import 'package:fixit_admin/views/widgets/portal_master_layout/sidebar.dart';

final sidebarMenuConfigs = [
  SidebarMenuConfig(
    uri: RouteUri.dashboard,
    icon: Icons.dashboard_rounded,
    title: (context) => context.l10n.dashboard,
  ),
  SidebarMenuConfig(
    uri: RouteUri.order,
    icon: Icons.list_alt_rounded,
    title: (context) => 'Order',
  ),
  SidebarMenuConfig(
    uri: RouteUri.technician,
    icon: Icons.people_alt_rounded,
    title: (context) => 'Technician',
  ),
  SidebarMenuConfig(
    uri: RouteUri.unverifiedTechnician,
    icon: Icons.person_add_alt_1_sharp,
    title: (context) => 'Unverified Technician',
  ),
  SidebarMenuConfig(
    uri: RouteUri.client,
    icon: Icons.people_alt_rounded,
    title: (context) => 'Client',
  ),
  SidebarMenuConfig(
    uri: RouteUri.electronic,
    icon: Icons.tv_rounded,
    title: (context) => 'Electronic',
  ),
  SidebarMenuConfig(
    uri: RouteUri.banner,
    icon: Icons.branding_watermark_rounded,
    title: (context) => 'Banner',
  ),
  // SidebarMenuConfig(
  //   uri: RouteUri.form,
  //   icon: Icons.edit_note_rounded,
  //   title: (context) => context.l10n.forms(1),
  // ),
  // SidebarMenuConfig(
  //   uri: '',
  //   icon: Icons.interests_rounded,
  //   title: (context) => context.l10n.uiElements(2),
  //   children: [
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.generalUi,
  //       icon: Icons.circle_outlined,
  //       title: (context) => context.l10n.generalUi,
  //     ),
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.colors,
  //       icon: Icons.circle_outlined,
  //       title: (context) => context.l10n.colors(2),
  //     ),
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.text,
  //       icon: Icons.circle_outlined,
  //       title: (context) => context.l10n.text,
  //     ),
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.buttons,
  //       icon: Icons.circle_outlined,
  //       title: (context) => context.l10n.buttons(2),
  //     ),
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.dialogs,
  //       icon: Icons.circle_outlined,
  //       title: (context) => context.l10n.dialogs(2),
  //     ),
  //   ],
  // ),
  // SidebarMenuConfig(
  //   uri: '',
  //   icon: Icons.library_books_rounded,
  //   title: (context) => context.l10n.pages(2),
  //   children: [
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.error404,
  //       icon: Icons.circle_outlined,
  //       title: (context) => context.l10n.error404,
  //     ),
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.login,
  //       icon: Icons.circle_outlined,
  //       title: (context) => context.l10n.login,
  //     ),
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.register,
  //       icon: Icons.circle_outlined,
  //       title: (context) => context.l10n.register,
  //     ),
  //     SidebarChildMenuConfig(
  //       uri: RouteUri.crud,
  //       icon: Icons.circle_outlined,
  //       title: (context) => 'CRUD',
  //     ),
  //   ],
  // ),
  // SidebarMenuConfig(
  //   uri: RouteUri.iframe,
  //   icon: Icons.laptop_windows_rounded,
  //   title: (context) => context.l10n.iframeDemo,
  // ),
];

const localeMenuConfigs = [
  LocaleMenuConfig(
    languageCode: 'en',
    name: 'English',
  ),
  LocaleMenuConfig(
    languageCode: 'id',
    name: 'Indonesia',
  ),
];
