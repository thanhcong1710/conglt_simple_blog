/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : conglt_simple_blog

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 14/08/2021 21:58:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for email_template
-- ----------------------------
DROP TABLE IF EXISTS `email_template`;
CREATE TABLE `email_template` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of email_template
-- ----------------------------
BEGIN;
INSERT INTO `email_template` VALUES (1, NULL, NULL, '<!DOCTYPE html>\n                <html lang=\"en\">\n                <head>\n                    <meta charset=\"utf-8\">\n                    <meta name=\"viewport\" content=\"width=device-width\">\n                    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\"> \n                    <meta name=\"x-apple-disable-message-reformatting\">\n                    <title>Example</title>\n                    <style>\n                        body {\n                            background-color:#fff;\n                            color:#222222;\n                            margin: 0px auto;\n                            padding: 0px;\n                            height: 100%;\n                            width: 100%;\n                            font-weight: 400;\n                            font-size: 15px;\n                            line-height: 1.8;\n                        }\n                        .continer{\n                            width:400px;\n                            margin-left:auto;\n                            margin-right:auto;\n                            background-color:#efefef;\n                            padding:30px;\n                        }\n                        .btn{\n                            padding: 5px 15px;\n                            display: inline-block;\n                        }\n                        .btn-primary{\n                            border-radius: 3px;\n                            background: #0b3c7c;\n                            color: #fff;\n                            text-decoration: none;\n                        }\n                        .btn-primary:hover{\n                            border-radius: 3px;\n                            background: #4673ad;\n                            color: #fff;\n                            text-decoration: none;\n                        }\n                    </style>\n                </head>\n                <body>\n                    <div class=\"continer\">\n                        <h1>Lorem ipsum dolor</h1>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea <strong>commodo consequat</strong>. \n                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n                        </p>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod <a href=\"#\">tempor incididunt ut labore</a> et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n                        </p>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. \n                        </p>\n                        <a href=\"#\" class=\"btn btn-primary\">Lorem ipsum dolor</a>\n                        <h4>Ipsum dolor cet emit amet</h4>\n                        <p>\n                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n                            Ut enim ad minim veniam, quis nostrud exercitation <a href=\"#\">ullamco</a> laboris nisi ut aliquip ex ea commodo consequat. \n                            Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. \n                            Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n                        </p>\n                    </div>\n                </body>\n                </html>', 'Example E-mail', 'Example E-mail');
COMMIT;

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for folder
-- ----------------------------
DROP TABLE IF EXISTS `folder`;
CREATE TABLE `folder` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `folder_id` int(10) unsigned DEFAULT NULL,
  `resource` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of folder
-- ----------------------------
BEGIN;
INSERT INTO `folder` VALUES (1, NULL, NULL, 'root', NULL, NULL);
INSERT INTO `folder` VALUES (2, NULL, NULL, 'resource', 1, 1);
INSERT INTO `folder` VALUES (3, NULL, NULL, 'documents', 1, NULL);
INSERT INTO `folder` VALUES (4, NULL, NULL, 'graphics', 1, NULL);
INSERT INTO `folder` VALUES (5, NULL, NULL, 'other', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `status` tinyint(2) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
INSERT INTO `jobs` VALUES (1, 'T??i ch??nh', 1);
INSERT INTO `jobs` VALUES (2, 'Kh??ch s???n ', 1);
INSERT INTO `jobs` VALUES (3, 'Kinh doanh', 1);
INSERT INTO `jobs` VALUES (4, 'Nh??n s???', 1);
INSERT INTO `jobs` VALUES (5, 'Ch??m s??c kh??ch h??ng', 1);
INSERT INTO `jobs` VALUES (6, 'B??n h??ng', 1);
INSERT INTO `jobs` VALUES (7, 'Gi??o d???c/????o t???o', 1);
INSERT INTO `jobs` VALUES (8, 'B??o ch?? - Truy???n h??nh', 1);
INSERT INTO `jobs` VALUES (9, 'B???t ?????ng s???n', 1);
INSERT INTO `jobs` VALUES (10, 'An ninh/V??? s??/B???o v???', 1);
INSERT INTO `jobs` VALUES (11, 'K??? to??n/Ki???m to??n', 1);
INSERT INTO `jobs` VALUES (12, 'Bi??n d???ch/Phi??n d???ch', 1);
INSERT INTO `jobs` VALUES (13, 'B??u ch??nh vi???n th??ng', 1);
INSERT INTO `jobs` VALUES (14, 'C?? kh??', 1);
INSERT INTO `jobs` VALUES (15, 'D???u kh??/?????a ch???t', 1);
INSERT INTO `jobs` VALUES (16, 'D???t may', 1);
INSERT INTO `jobs` VALUES (17, 'Du l???ch', 1);
INSERT INTO `jobs` VALUES (18, 'Nh?? h??ng', 1);
INSERT INTO `jobs` VALUES (19, 'D?????c/Y t???', 1);
INSERT INTO `jobs` VALUES (20, 'H??a ch???t/Sinh h??a', 1);
INSERT INTO `jobs` VALUES (21, '??i???n t??? - ??i???n l???nh', 1);
INSERT INTO `jobs` VALUES (22, 'Gi???i tr??', 1);
INSERT INTO `jobs` VALUES (23, 'Giao th??ng v???n t???i/C???u ???????ng', 1);
INSERT INTO `jobs` VALUES (24, 'Thu mua', 1);
INSERT INTO `jobs` VALUES (25, 'Khu c??ng nghi???p', 1);
INSERT INTO `jobs` VALUES (26, 'Spa - M??? ph???m - Trang s???c', 1);
INSERT INTO `jobs` VALUES (27, 'Th??? d???c th??? thao', 1);
INSERT INTO `jobs` VALUES (28, 'Lao ?????ng ph??? th??ng', 1);
INSERT INTO `jobs` VALUES (29, 'Lu???t ph??p', 1);
INSERT INTO `jobs` VALUES (30, '??i???n t??? vi???n th??ng', 1);
INSERT INTO `jobs` VALUES (31, 'H??ng h???i', 1);
INSERT INTO `jobs` VALUES (32, 'D???t may - Da gi??y', 1);
INSERT INTO `jobs` VALUES (33, 'C??ng ngh??? cao', 1);
INSERT INTO `jobs` VALUES (34, 'K??? thu???t ???ng d???ng', 1);
INSERT INTO `jobs` VALUES (35, 'T??? ch???c s??? ki???n', 1);
INSERT INTO `jobs` VALUES (36, 'Th???c ph???m', 1);
INSERT INTO `jobs` VALUES (37, 'V???n t???i', 1);
INSERT INTO `jobs` VALUES (38, 'M??i tr?????ng/X??? l?? ch???t th???i', 1);
INSERT INTO `jobs` VALUES (39, 'Ng??n h??ng', 1);
INSERT INTO `jobs` VALUES (40, 'Ch???ng kho??n/?????u t??', 1);
INSERT INTO `jobs` VALUES (41, 'Ngh??? thu???t', 1);
INSERT INTO `jobs` VALUES (42, '??i???n ???nh', 1);
INSERT INTO `jobs` VALUES (43, 'Ngo???i ng???', 1);
INSERT INTO `jobs` VALUES (44, 'N??ng/L??m/Ng?? nghi???p', 1);
INSERT INTO `jobs` VALUES (45, 'Ph??t tri???n th??? tr?????ng', 1);
INSERT INTO `jobs` VALUES (46, 'Gi??p vi???c', 1);
INSERT INTO `jobs` VALUES (47, 'Quan h??? ?????i ngo???i', 1);
INSERT INTO `jobs` VALUES (48, 'Qu???ng c??o/Marketing/PR', 1);
INSERT INTO `jobs` VALUES (49, 'S???n xu???t', 1);
INSERT INTO `jobs` VALUES (50, 'Sinh vi??n/Th???c t???p sinh', 1);
INSERT INTO `jobs` VALUES (51, 'Th???m ?????nh/Gi??m ?????nh', 1);
INSERT INTO `jobs` VALUES (52, 'Thi???t k???/M??? thu???t', 1);
INSERT INTO `jobs` VALUES (53, 'Th???i v???/B??n th???i gian', 1);
INSERT INTO `jobs` VALUES (54, '????? u???ng', 1);
INSERT INTO `jobs` VALUES (55, 'Trang thi???t b??? c??ng nghi???p', 1);
INSERT INTO `jobs` VALUES (56, 'T?? v???n b???o hi???m', 1);
INSERT INTO `jobs` VALUES (57, 'X??y d???ng', 1);
INSERT INTO `jobs` VALUES (58, 'Qu???n tr??? kinh doanh', 1);
INSERT INTO `jobs` VALUES (59, 'Xu???t - Nh???p kh???u/Ngo???i th????ng', 1);
INSERT INTO `jobs` VALUES (60, 'Ki???n tr??c/N???i th???t', 1);
INSERT INTO `jobs` VALUES (61, 'B???o hi???m', 1);
INSERT INTO `jobs` VALUES (62, 'H??nh ch??nh/Th?? k??/Tr??? l??', 1);
INSERT INTO `jobs` VALUES (63, 'T??i x???/Giao nh???n', 1);
INSERT INTO `jobs` VALUES (64, '????? gia d???ng', 1);
INSERT INTO `jobs` VALUES (65, 'Ti???p th??? qu???ng c??o', 1);
INSERT INTO `jobs` VALUES (66, 'Th????ng m???i ??i???n t???', 1);
INSERT INTO `jobs` VALUES (67, 'H??ng kh??ng', 1);
INSERT INTO `jobs` VALUES (68, 'Th??? c??ng m??? ngh???', 1);
INSERT INTO `jobs` VALUES (69, 'Ho???ch ?????nh - D??? ??n', 1);
INSERT INTO `jobs` VALUES (70, 'Kho v???n - V???t t??', 1);
INSERT INTO `jobs` VALUES (71, 'Kh??c', 1);
COMMIT;

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  `collection_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `disk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` bigint(20) unsigned NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `media_model_type_model_id_index` (`model_type`,`model_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of media
-- ----------------------------
BEGIN;
INSERT INTO `media` VALUES (2, 'App\\Models\\Folder', 2, 'default', 'FullSizeRender 2.jpg', '20200827050953FullSizeRender-2.jpg', 'image/jpeg', 'public', 1604293, '[]', '[]', '[]', 1, '2020-08-27 05:09:53', '2020-08-27 05:09:53');
COMMIT;

-- ----------------------------
-- Table structure for menu_role
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `menus_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu_role
-- ----------------------------
BEGIN;
INSERT INTO `menu_role` VALUES (5, 'guest', 3);
INSERT INTO `menu_role` VALUES (6, 'admin', 4);
INSERT INTO `menu_role` VALUES (7, 'admin', 5);
INSERT INTO `menu_role` VALUES (8, 'admin', 6);
INSERT INTO `menu_role` VALUES (9, 'admin', 7);
INSERT INTO `menu_role` VALUES (18, 'user', 13);
INSERT INTO `menu_role` VALUES (19, 'admin', 13);
INSERT INTO `menu_role` VALUES (20, 'user', 14);
INSERT INTO `menu_role` VALUES (21, 'admin', 14);
INSERT INTO `menu_role` VALUES (22, 'user', 15);
INSERT INTO `menu_role` VALUES (23, 'admin', 15);
INSERT INTO `menu_role` VALUES (24, 'user', 16);
INSERT INTO `menu_role` VALUES (25, 'admin', 16);
INSERT INTO `menu_role` VALUES (26, 'user', 17);
INSERT INTO `menu_role` VALUES (27, 'admin', 17);
INSERT INTO `menu_role` VALUES (28, 'user', 18);
INSERT INTO `menu_role` VALUES (29, 'admin', 18);
INSERT INTO `menu_role` VALUES (30, 'user', 19);
INSERT INTO `menu_role` VALUES (31, 'admin', 19);
INSERT INTO `menu_role` VALUES (32, 'user', 20);
INSERT INTO `menu_role` VALUES (33, 'admin', 20);
INSERT INTO `menu_role` VALUES (34, 'user', 21);
INSERT INTO `menu_role` VALUES (35, 'admin', 21);
INSERT INTO `menu_role` VALUES (36, 'user', 22);
INSERT INTO `menu_role` VALUES (37, 'admin', 22);
INSERT INTO `menu_role` VALUES (38, 'user', 23);
INSERT INTO `menu_role` VALUES (39, 'admin', 23);
INSERT INTO `menu_role` VALUES (40, 'user', 24);
INSERT INTO `menu_role` VALUES (41, 'admin', 24);
INSERT INTO `menu_role` VALUES (42, 'user', 25);
INSERT INTO `menu_role` VALUES (43, 'admin', 25);
INSERT INTO `menu_role` VALUES (44, 'user', 26);
INSERT INTO `menu_role` VALUES (45, 'admin', 26);
INSERT INTO `menu_role` VALUES (46, 'user', 27);
INSERT INTO `menu_role` VALUES (47, 'admin', 27);
INSERT INTO `menu_role` VALUES (48, 'user', 28);
INSERT INTO `menu_role` VALUES (49, 'admin', 28);
INSERT INTO `menu_role` VALUES (50, 'user', 29);
INSERT INTO `menu_role` VALUES (51, 'admin', 29);
INSERT INTO `menu_role` VALUES (52, 'user', 30);
INSERT INTO `menu_role` VALUES (53, 'admin', 30);
INSERT INTO `menu_role` VALUES (54, 'user', 31);
INSERT INTO `menu_role` VALUES (55, 'admin', 31);
INSERT INTO `menu_role` VALUES (56, 'user', 32);
INSERT INTO `menu_role` VALUES (57, 'admin', 32);
INSERT INTO `menu_role` VALUES (58, 'user', 33);
INSERT INTO `menu_role` VALUES (59, 'admin', 33);
INSERT INTO `menu_role` VALUES (60, 'user', 34);
INSERT INTO `menu_role` VALUES (61, 'admin', 34);
INSERT INTO `menu_role` VALUES (62, 'user', 35);
INSERT INTO `menu_role` VALUES (63, 'admin', 35);
INSERT INTO `menu_role` VALUES (64, 'user', 36);
INSERT INTO `menu_role` VALUES (65, 'admin', 36);
INSERT INTO `menu_role` VALUES (66, 'user', 37);
INSERT INTO `menu_role` VALUES (67, 'admin', 37);
INSERT INTO `menu_role` VALUES (68, 'user', 38);
INSERT INTO `menu_role` VALUES (69, 'admin', 38);
INSERT INTO `menu_role` VALUES (70, 'user', 39);
INSERT INTO `menu_role` VALUES (71, 'admin', 39);
INSERT INTO `menu_role` VALUES (72, 'user', 40);
INSERT INTO `menu_role` VALUES (73, 'admin', 40);
INSERT INTO `menu_role` VALUES (74, 'user', 41);
INSERT INTO `menu_role` VALUES (75, 'admin', 41);
INSERT INTO `menu_role` VALUES (76, 'user', 42);
INSERT INTO `menu_role` VALUES (77, 'admin', 42);
INSERT INTO `menu_role` VALUES (78, 'user', 43);
INSERT INTO `menu_role` VALUES (79, 'admin', 43);
INSERT INTO `menu_role` VALUES (80, 'user', 44);
INSERT INTO `menu_role` VALUES (81, 'admin', 44);
INSERT INTO `menu_role` VALUES (82, 'user', 45);
INSERT INTO `menu_role` VALUES (83, 'admin', 45);
INSERT INTO `menu_role` VALUES (84, 'user', 46);
INSERT INTO `menu_role` VALUES (85, 'admin', 46);
INSERT INTO `menu_role` VALUES (86, 'user', 47);
INSERT INTO `menu_role` VALUES (87, 'admin', 47);
INSERT INTO `menu_role` VALUES (88, 'user', 48);
INSERT INTO `menu_role` VALUES (89, 'admin', 48);
INSERT INTO `menu_role` VALUES (90, 'user', 49);
INSERT INTO `menu_role` VALUES (91, 'admin', 49);
INSERT INTO `menu_role` VALUES (92, 'user', 50);
INSERT INTO `menu_role` VALUES (93, 'admin', 50);
INSERT INTO `menu_role` VALUES (94, 'guest', 51);
INSERT INTO `menu_role` VALUES (95, 'user', 51);
INSERT INTO `menu_role` VALUES (96, 'admin', 51);
INSERT INTO `menu_role` VALUES (117, 'guest', 2);
INSERT INTO `menu_role` VALUES (124, 'admin', 63);
INSERT INTO `menu_role` VALUES (128, 'admin', 65);
INSERT INTO `menu_role` VALUES (129, 'user', 65);
INSERT INTO `menu_role` VALUES (130, 'guest', 65);
INSERT INTO `menu_role` VALUES (148, 'admin', 1);
INSERT INTO `menu_role` VALUES (149, 'user', 1);
INSERT INTO `menu_role` VALUES (150, 'guest', 1);
INSERT INTO `menu_role` VALUES (151, 'admin', 64);
INSERT INTO `menu_role` VALUES (152, 'user', 64);
COMMIT;

-- ----------------------------
-- Table structure for menulist
-- ----------------------------
DROP TABLE IF EXISTS `menulist`;
CREATE TABLE `menulist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menulist
-- ----------------------------
BEGIN;
INSERT INTO `menulist` VALUES (1, 'sidebar menu');
INSERT INTO `menulist` VALUES (2, 'top_menu');
COMMIT;

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `href` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `menu_id` int(10) unsigned NOT NULL,
  `sequence` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
BEGIN;
INSERT INTO `menus` VALUES (1, 'Blogs', '/blogs', 'cil-speedometer', 'link', NULL, 1, 1);
INSERT INTO `menus` VALUES (2, 'Login', '/login', 'cil-account-logout', 'link', NULL, 1, 3);
INSERT INTO `menus` VALUES (3, 'Register', '/register', 'cil-account-logout', 'link', NULL, 1, 4);
INSERT INTO `menus` VALUES (4, 'Settings', '/', 'cil-puzzle', 'dropdown', NULL, 1, 7);
INSERT INTO `menus` VALUES (5, 'Media', '/media', NULL, 'link', 4, 1, 5);
INSERT INTO `menus` VALUES (6, 'Users', '/users', NULL, 'link', 4, 1, 10);
INSERT INTO `menus` VALUES (7, 'Menu', '/menu', NULL, 'link', 4, 1, 11);
INSERT INTO `menus` VALUES (63, 'Role', '/roles', NULL, 'link', 4, 1, 12);
INSERT INTO `menus` VALUES (64, 'Qu???n L?? B??i Vi???t', '/posts', 'cil-puzzle', 'link', NULL, 1, 2);
COMMIT;

-- ----------------------------
-- Table structure for model_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `model_has_permissions`;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for model_has_roles
-- ----------------------------
DROP TABLE IF EXISTS `model_has_roles`;
CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`) USING BTREE,
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`) USING BTREE,
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of model_has_roles
-- ----------------------------
BEGIN;
INSERT INTO `model_has_roles` VALUES (1, 'App\\User', 1);
INSERT INTO `model_has_roles` VALUES (2, 'App\\User', 1);
INSERT INTO `model_has_roles` VALUES (1, 'App\\User', 2);
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro_text` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `status` tinyint(2) DEFAULT '0',
  `published_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `creator_id` (`creator_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
BEGIN;
INSERT INTO `posts` VALUES (1, 'TP HCM sau 20 ng??y si???t ch???t', 'Qua 20 ng??y si???t ch???t gi??n c??ch x?? h???i, TP HCM ghi nh???n bi???u ????? ca nhi???m m???i ??i ngang nh??ng v???n ????? th??nh ph??? quan t??m nh???t hi???n nay l?? con s??? t??? vong.', '<p class=\"description\">Qua 20 ng??y si???t ch???t gi??n c??ch x?? h???i, TP HCM ghi nh???n bi???u ????? ca nhi???m m???i ??i ngang nh??ng v???n ????? th??nh ph??? quan t??m nh???t hi???n nay l?? con s??? t??? vong.</p>\n<article class=\"fck_detail \">\n<p class=\"Normal\">\"D???ch v???n ph???c t???p v?? ???? th???m s??u trong c???ng ?????ng, s??? ca nhi???m g???n ????y c?? xu h?????ng gi???m, ??i ngang nh??ng ch??a b???n v???ng\", Ph?? ch??? t???ch UBND th??nh ph??? D????ng Anh ?????c n??i, khi ????nh gi?? v??? c??ng t??c ph??ng ch???ng Covid-19 tr??n ?????a b??n.</p>\n<p class=\"Normal\">TP HCM nh???ng ng??y qua ??ang ??p d???ng bi???n ph??p m???nh nh???t k??? t??? khi d???ch xu???t hi???n. Ng?????i d??n ???? tr???i qua 37 ng??y gi??n c??ch x?? h???i theo Ch??? th??? 16, trong ????, th??nh ph??? c?? 20 ng??y ??p d???ng th??m c??c bi???n ph??p t??ng c?????ng nh????<a href=\"https://vnexpress.net/tp-hcm-yeu-cau-nguoi-dan-khong-ra-duong-sau-18h-4330354.html\" rel=\"dofollow\">c???m ra ???????ng</a>, ng??ng c??c ho???t ?????ng kh??ng thi???t y???u sau 18h...</p>\n<p class=\"Normal\">Kho???ng th???i gian n??y, s??? ca F0 m???i m???i ng??y tr??n ?????a b??n kh??ng c??n \"?????t bi???n\" ??? m???c 5.000-6.000 ca nh?? tr?????c ???? m?? duy tr?? con s??? g???n 4.000, ph???n l???n trong c??c khu phong t???a. Ch???ng h???n, m???t tu???n g???n nh???t t??? 5/8, trung b??nh m???i ng??y, th??nh ph??? ghi nh???n 3.687 ca nhi???m, trong ???? 78,6% ??? khu phong t???a, 2,3% trong khu c??ch ly, 17,7% qua s??ng l???c t???i b???nh vi???n.</p>\n</article>', 1, '2021-08-14 16:04:00', '2021-08-14 06:56:26', 1, '2021-08-14 07:18:35', 1);
INSERT INTO `posts` VALUES (3, 'demo', 'demo', '<p>demo</p>', 0, NULL, '2021-08-14 07:45:58', 1, NULL, NULL);
INSERT INTO `posts` VALUES (4, 'Ai ???????c ra ???????ng khi ???? N???ng \'d???ng ho???t ?????ng 7 ng??y\'?', 'Chi???u 14/8, Ch??? t???ch TP ???? N???ng L?? Trung Chinh quy ?????nh nh???ng ng?????i ???????c ph??p ra ???????ng t??? 8h ng??y 16 ?????n 8h ng??y 23/8. ???? l?? ng?????i th???c hi???n nhi???m v??? ph??ng, ch???ng d???ch Covid-19; ng?????i v???n chuy???n, cung ???ng d?????c ph???m, v???t t?? y t???, h??a ch???t cho c?? s??? y t???; ph??n ph???i l????ng th???c, th???c ph???m v?? h??ng thi???t y???u', '<p class=\"description\">Ng?????i l??m nhi???m v??? ph??ng ch???ng Covid-19, ?????m b???o ph???c v??? nhu c???u thi???t y???u cho ng?????i d??n ???????c ph??p ra ???????ng, theo quy???t ?????nh c???a UBND TP ???? N???ng.</p>\n<article class=\"fck_detail \">\n<p class=\"Normal\">Chi???u 14/8, Ch??? t???ch TP ???? N???ng L?? Trung Chinh quy ?????nh nh???ng ng?????i ???????c ph??p ra ???????ng t??? 8h ng??y 16 ?????n 8h ng??y 23/8. ???? l?? ng?????i th???c hi???n nhi???m v??? ph??ng, ch???ng d???ch Covid-19; ng?????i v???n chuy???n, cung ???ng d?????c ph???m, v???t t?? y t???, h??a ch???t cho c?? s??? y t???; ph??n ph???i l????ng th???c, th???c ph???m v?? h??ng thi???t y???u cho ng?????i d??n; giao nh???n h??ng h??a xu???t nh???p kh???u t??? c???ng ?????n ??i???m giao h??ng v?? ng?????c l???i; v???n chuy???n c??ng v???; b??u ch??nh nh?? n?????c; c??ng nh??n v??? sinh m??i tr?????ng, ch??m s??c c??y xanh ???? th???, x??? l?? s??? c??? ??i???n, n?????c, th??ng tin, vi???n th??ng.</p>\n<p class=\"Normal\">Ngo??i ra, c??n c?? ng?????i ??i c???p c???u; kh??m, ch???a b???nh ?????nh k??? t???i c?? s??? y t??? tr??n ?????a b??n; ??i x??t nghi???m ho???c ti??m ch???ng Covid-19; ng?????i ??i c??ch ly ho???c ho??n th??nh th???i gian c??ch ly t???p trung tr??? v??? nh??; ng?????i xu???t vi???n; ng?????i ?????n c???ng h??ng kh??ng qu???c t??? ????? th???c hi???n chuy???n bay ??i n?????c ngo??i khi ???? c?? v??.</p>\n<p class=\"Normal\">Ph??ng vi??n ???????c ra ???????ng t??c nghi???p b??o ch??, nh??ng ph???i ?????m b???o t???i ??a kh??ng qu?? 6 ng?????i/????n v??? ph??t thanh, truy???n h??nh; kh??ng qu?? 2 ng?????i v???i b??o in, b??o ??i???n t??? (tr??? c??c lo???i h??nh t???p ch??).</p>\n<p class=\"Normal\"><strong>Nh???ng ng?????i ?????n n??i l??m vi???c, s???n xu???t ph???i ?????m b???o \"3 t???i ch???\" (l??m vi???c, ??n u???ng, ngh??? ng??i t???i ch???) v?? ???????c xem l?? m???t ??i???m c??ch ly,??</strong>bao g???m: Ng?????i ?????n l??m vi???c t???i c?? quan, c??ng s??? nh?? n?????c (kh??ng qu?? 10%); trung t??m th????ng m???i, si??u th???, chu???i c???a h??ng ti???n l???i (si??u th??? mini), c??ng ty th????ng m???i ?????u m???i; nh?? thu???c/qu???y thu???c; c?? s??? y t??? trong v?? ngo??i c??ng l???p; c?? s??? c??ch ly y t??? t???p trung.</p>\n<p class=\"Normal\">Th??m v??o ???? c??n c?? ng?????i ?????n l??m vi???c t???i c??c c?? s??? cung c???p gas, c???p ??i???n, c???p n?????c, x??ng d???u; ng??n h??ng; b??u ch??nh, vi???n th??ng; c???ng h??ng kh??ng, c???ng bi???n, nh?? ga ???????ng s???t, tr???m qu???n l?? ???????ng b???; c?? s??? s???n xu???t su???t ??n c??ng nghi???p; l??m vi???c t???i c??c c?? s??? s???n xu???t trong khu c??ng nghi???p v?? khu c??ng ngh??? cao (ch??? ???????c b??? tr?? t???i ??a 30% s??? ng?????i l??m vi???c).</p>\n<figure class=\"tplCaption action_thumb_added\" data-size=\"true\">\n<div class=\"fig-picture\"><picture><source srcset=\"https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NA2c0-P8MSMeTSRiomesCg 1x, https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=TeW4FiutyjMZoIdlUaFL4A 1.5x, https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=Gs3F2JXfPJ08iTQHKKppMA 2x\" data-srcset=\"https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NA2c0-P8MSMeTSRiomesCg 1x, https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=TeW4FiutyjMZoIdlUaFL4A 1.5x, https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=Gs3F2JXfPJ08iTQHKKppMA 2x\" /><img class=\"lazy lazied\" src=\"https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NA2c0-P8MSMeTSRiomesCg\" alt=\"Ng?????i d??n l??u th??ng qua c???u R???ng, l??c 7h s??ng 14/8. ???nh: Nguy???n ????ng.\" loading=\"lazy\" data-src=\"https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NA2c0-P8MSMeTSRiomesCg\" data-ll-status=\"loaded\" /></picture></div>\n<figcaption>\n<p class=\"Image\">Ng?????i d??n l??u th??ng qua c???u R???ng l??c 7h s??ng 14/8. ???nh:<em>??Nguy???n ????ng.</em></p>\n</figcaption>\n</figure>\n<p class=\"Normal\">Nh???ng tr?????ng h???p ra ???????ng trong ho???t ?????ng kh???n c???p kh??c ph???i ???????c Ch??? t???ch UBND th??nh ph??? ho???c c??c qu???n, huy???n quy???t ?????nh. C??c c?? quan, ????n v???, c?? s??? s???n xu???t, kinh doanh, d???ch v??? ph???i c?? l??nh ?????o, nh??n vi??n tr???c theo nguy??n t???c \"3 t???i ch???\" ????? ?????m b???o an ninh, an to??n ph??ng, ch???ng ch??y n???.</p>\n<p class=\"Normal\">Gi??m ?????c C??ng an th??nh ph??? v?? Tr?????ng c??ng an c??c qu???n, huy???n ???????c giao h?????ng d???n, c???p th??? nh???n di???n ?????i v???i ng?????i ???????c ph??p ra ngo??i v?? tham gia giao th??ng; ??i???u ph???i l???c l?????ng ki???m tra, x??? l?? tr?????ng h???p vi ph???m.</p>\n<p class=\"Normal\">Trong 7 ng??y th??nh ph??? t???m d???ng ho???t ?????ng, S??? Y t??? ???? N???ng l???y m???u x??t nghi???m cho to??n b??? ng?????i d??n ??? khu ??ang phong t???a (39.550 ng?????i); ?????i di???n h??? gia ????nh ??? khu v???c c??n l???i tr??n ?????a b??n (kho???ng 219.740 ng?????i). \"Th??nh ph??? s??? x??t nghi???m to??n di???n, kh??ng b??? s??t b???t c??? h??? gia ????nh n??o ????? quy???t t??m ????a t???t c??? F0 ra kh???i c???ng ?????ng\", Gi??m ?????c S??? Y t??? ???? N???ng Ng?? Th??? Kim Y???n n??i.</p>\n<p class=\"Normal\">Theo b?? Y???n, n??ng l???c ??i???u tr??? b???nh nh??n Covid-19 ??? ???? N???ng hi???n nay c?? th??? ????p ???ng ???????c 6.000 gi?????ng b???nh, trong ???? ch??? 300 gi?????ng h???i s???c t??ch c???c c?? ?????y ????? trang thi???t b??? y t???. Th??nh ph??? ph???i ??p d???ng bi???n ph??p kh??ng ????? ng?????i d??n ra ???????ng trong 7 ng??y nh???m ki???m so??t d???ch b???nh v?? \"kh??ng ????? h??? th???ng y t??? b??? qu?? t???i nh?? m???t s??? t???nh ph??a Nam\".</p>\n<figure class=\"tplCaption action_thumb_added\" data-size=\"true\">\n<div class=\"fig-picture\"><picture><source srcset=\"https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=jTH0PmJh9CGmBUHSKT4_hw 1x, https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=PT9Fu1nQoPg9cbu9vtz0YA 1.5x, https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=pLZ_LBaSDCfs0WRtd5Fuqw 2x\" data-srcset=\"https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=jTH0PmJh9CGmBUHSKT4_hw 1x, https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=PT9Fu1nQoPg9cbu9vtz0YA 1.5x, https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=pLZ_LBaSDCfs0WRtd5Fuqw 2x\" /><img class=\"lazy lazied\" src=\"https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=jTH0PmJh9CGmBUHSKT4_hw\" alt=\"Ng?????i l???n tu???i ??? khu v???c ??ang phong to??? ??? ph?????ng M??n Th??i (qu???n S??n Tr??), ???????c ti??m vaccine, chi???u 14/8. ???nh: Nguy???n Quang.\" loading=\"lazy\" data-src=\"https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=jTH0PmJh9CGmBUHSKT4_hw\" data-ll-status=\"loaded\" /></picture></div>\n<figcaption>\n<p class=\"Image\">Ng?????i l???n tu???i ??? khu v???c ??ang phong t???a ??? ph?????ng M??n Th??i (qu???n S??n Tr??), ???????c ti??m vaccine, chi???u 14/8. ???nh:??<em>Nguy???n Quang.</em></p>\n</figcaption>\n</figure>\n<p class=\"Normal\">Ng?????i lao ?????ng l??m vi???c t???i doanh nghi???p t??? ch???c l??m vi???c theo ph????ng ??n \"3 t???i ch???\" s??? l???y m???u x??t nghi???m t???n su???t 3 ng??y/l???n, chi ph?? do doanh nghi???p chi tr???. Ng?????i d??n trong v??ng phong t???a c??ng l???y m???u 3 ng??y/l???n.</p>\n<p class=\"Normal\">H??m nay, ???? N???ng ghi nh???n th??m 91 ng?????i m???c Covid-19 (23 ng?????i ???????c c??ch ly t???p trung t??? tr?????c), n??ng s??? ca t??? ng??y 10/7 ?????n nay l??n 1.700. Chu???i l??y nhi???m \"nguy c?? r???t cao\" li??n quan ch??? ?????u m???i H??a C?????ng ghi nh???n 87 b???nh nh??n trong 3 ng??y, ??a s??? l?? ti???u th????ng.</p>\n</article>', 1, '2021-08-14 21:46:00', '2021-08-14 14:46:11', 12, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for role_has_permissions
-- ----------------------------
DROP TABLE IF EXISTS `role_has_permissions`;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`) USING BTREE,
  KEY `role_has_permissions_role_id_foreign` (`role_id`) USING BTREE,
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_has_permissions
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for role_hierarchy
-- ----------------------------
DROP TABLE IF EXISTS `role_hierarchy`;
CREATE TABLE `role_hierarchy` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `hierarchy` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of role_hierarchy
-- ----------------------------
BEGIN;
INSERT INTO `role_hierarchy` VALUES (1, 1, 1);
INSERT INTO `role_hierarchy` VALUES (2, 2, 2);
INSERT INTO `role_hierarchy` VALUES (3, 3, 3);
COMMIT;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
BEGIN;
INSERT INTO `roles` VALUES (1, 'admin', 'api', '2020-08-27 02:04:43', '2020-08-27 02:04:43');
INSERT INTO `roles` VALUES (2, 'user', 'api', '2020-08-27 02:04:43', '2020-08-27 02:04:43');
INSERT INTO `roles` VALUES (3, 'guest', 'api', '2020-08-27 02:04:43', '2020-08-27 02:04:43');
COMMIT;

-- ----------------------------
-- Table structure for sources
-- ----------------------------
DROP TABLE IF EXISTS `sources`;
CREATE TABLE `sources` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0 - inactive, 1 - active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of sources
-- ----------------------------
BEGIN;
INSERT INTO `sources` VALUES (24, 'Trung t??m', 'Trung t??m', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (25, 'V??ng lai', 'V??ng lai', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (26, 'Marketing', 'Marketing', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (27, 'Sale Hub MB', 'Sale Hub MB', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (28, 'CTV', 'CTV', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (29, 'Gi???i thi???u', 'Gi???i thi???u', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (30, 'Kh??c', 'Kh??c', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (31, 'Sale Hub MN', 'Sale Hub MN', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (32, 'Ph??t tri???n ?????i t??c', 'Ph??t tri???n ?????i t??c', 1, NULL, '2020-09-19 11:22:28');
INSERT INTO `sources` VALUES (33, 'Apax', 'Apax', 1, NULL, '2021-04-07 11:22:28');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `menuroles` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `users_email_unique` (`email`) USING BTREE,
  UNIQUE KEY `users_api_token_unique` (`api_token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'admin', 'admin@admin.com', '2020-08-27 02:04:43', '$2y$10$upeEWEPRUHvriPrThSy8hOMzfqxFGRFPrBP0UgkBwC8C54RBz/6C6', NULL, 'admin,user', 'Active', 'EQt3UDeo4F', '2020-08-27 02:04:43', '2021-07-23 08:07:52', NULL);
INSERT INTO `users` VALUES (12, 'member', 'member@member.com', NULL, '$2y$10$nMSv7ukEKQnHd4ng/pSOA.o8baAl3ykBQ2p0vImoeRW5D75b730yq', NULL, 'user', 'Active', NULL, '2021-08-14 14:40:44', '2021-08-14 14:40:44', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
