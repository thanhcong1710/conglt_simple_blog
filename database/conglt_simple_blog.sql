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
INSERT INTO `jobs` VALUES (1, 'Tài chính', 1);
INSERT INTO `jobs` VALUES (2, 'Khách sạn ', 1);
INSERT INTO `jobs` VALUES (3, 'Kinh doanh', 1);
INSERT INTO `jobs` VALUES (4, 'Nhân sự', 1);
INSERT INTO `jobs` VALUES (5, 'Chăm sóc khách hàng', 1);
INSERT INTO `jobs` VALUES (6, 'Bán hàng', 1);
INSERT INTO `jobs` VALUES (7, 'Giáo dục/Đào tạo', 1);
INSERT INTO `jobs` VALUES (8, 'Báo chí - Truyền hình', 1);
INSERT INTO `jobs` VALUES (9, 'Bất động sản', 1);
INSERT INTO `jobs` VALUES (10, 'An ninh/Vệ sĩ/Bảo vệ', 1);
INSERT INTO `jobs` VALUES (11, 'Kế toán/Kiểm toán', 1);
INSERT INTO `jobs` VALUES (12, 'Biên dịch/Phiên dịch', 1);
INSERT INTO `jobs` VALUES (13, 'Bưu chính viễn thông', 1);
INSERT INTO `jobs` VALUES (14, 'Cơ khí', 1);
INSERT INTO `jobs` VALUES (15, 'Dầu khí/Địa chất', 1);
INSERT INTO `jobs` VALUES (16, 'Dệt may', 1);
INSERT INTO `jobs` VALUES (17, 'Du lịch', 1);
INSERT INTO `jobs` VALUES (18, 'Nhà hàng', 1);
INSERT INTO `jobs` VALUES (19, 'Dược/Y tế', 1);
INSERT INTO `jobs` VALUES (20, 'Hóa chất/Sinh hóa', 1);
INSERT INTO `jobs` VALUES (21, 'Điện tử - Điện lạnh', 1);
INSERT INTO `jobs` VALUES (22, 'Giải trí', 1);
INSERT INTO `jobs` VALUES (23, 'Giao thông vận tải/Cầu đường', 1);
INSERT INTO `jobs` VALUES (24, 'Thu mua', 1);
INSERT INTO `jobs` VALUES (25, 'Khu công nghiệp', 1);
INSERT INTO `jobs` VALUES (26, 'Spa - Mỹ phẩm - Trang sức', 1);
INSERT INTO `jobs` VALUES (27, 'Thể dục thể thao', 1);
INSERT INTO `jobs` VALUES (28, 'Lao động phổ thông', 1);
INSERT INTO `jobs` VALUES (29, 'Luật pháp', 1);
INSERT INTO `jobs` VALUES (30, 'Điện tử viễn thông', 1);
INSERT INTO `jobs` VALUES (31, 'Hàng hải', 1);
INSERT INTO `jobs` VALUES (32, 'Dệt may - Da giày', 1);
INSERT INTO `jobs` VALUES (33, 'Công nghệ cao', 1);
INSERT INTO `jobs` VALUES (34, 'Kỹ thuật ứng dụng', 1);
INSERT INTO `jobs` VALUES (35, 'Tổ chức sự kiện', 1);
INSERT INTO `jobs` VALUES (36, 'Thực phẩm', 1);
INSERT INTO `jobs` VALUES (37, 'Vận tải', 1);
INSERT INTO `jobs` VALUES (38, 'Môi trường/Xử lý chất thải', 1);
INSERT INTO `jobs` VALUES (39, 'Ngân hàng', 1);
INSERT INTO `jobs` VALUES (40, 'Chứng khoán/Đầu tư', 1);
INSERT INTO `jobs` VALUES (41, 'Nghệ thuật', 1);
INSERT INTO `jobs` VALUES (42, 'Điện ảnh', 1);
INSERT INTO `jobs` VALUES (43, 'Ngoại ngữ', 1);
INSERT INTO `jobs` VALUES (44, 'Nông/Lâm/Ngư nghiệp', 1);
INSERT INTO `jobs` VALUES (45, 'Phát triển thị trường', 1);
INSERT INTO `jobs` VALUES (46, 'Giúp việc', 1);
INSERT INTO `jobs` VALUES (47, 'Quan hệ đối ngoại', 1);
INSERT INTO `jobs` VALUES (48, 'Quảng cáo/Marketing/PR', 1);
INSERT INTO `jobs` VALUES (49, 'Sản xuất', 1);
INSERT INTO `jobs` VALUES (50, 'Sinh viên/Thực tập sinh', 1);
INSERT INTO `jobs` VALUES (51, 'Thẩm định/Giám định', 1);
INSERT INTO `jobs` VALUES (52, 'Thiết kế/Mỹ thuật', 1);
INSERT INTO `jobs` VALUES (53, 'Thời vụ/Bán thời gian', 1);
INSERT INTO `jobs` VALUES (54, 'Đồ uống', 1);
INSERT INTO `jobs` VALUES (55, 'Trang thiết bị công nghiệp', 1);
INSERT INTO `jobs` VALUES (56, 'Tư vấn bảo hiểm', 1);
INSERT INTO `jobs` VALUES (57, 'Xây dựng', 1);
INSERT INTO `jobs` VALUES (58, 'Quản trị kinh doanh', 1);
INSERT INTO `jobs` VALUES (59, 'Xuất - Nhập khẩu/Ngoại thương', 1);
INSERT INTO `jobs` VALUES (60, 'Kiến trúc/Nội thất', 1);
INSERT INTO `jobs` VALUES (61, 'Bảo hiểm', 1);
INSERT INTO `jobs` VALUES (62, 'Hành chính/Thư ký/Trợ lý', 1);
INSERT INTO `jobs` VALUES (63, 'Tài xế/Giao nhận', 1);
INSERT INTO `jobs` VALUES (64, 'Đồ gia dụng', 1);
INSERT INTO `jobs` VALUES (65, 'Tiếp thị quảng cáo', 1);
INSERT INTO `jobs` VALUES (66, 'Thương mại điện tử', 1);
INSERT INTO `jobs` VALUES (67, 'Hàng không', 1);
INSERT INTO `jobs` VALUES (68, 'Thủ công mỹ nghệ', 1);
INSERT INTO `jobs` VALUES (69, 'Hoạch định - Dự án', 1);
INSERT INTO `jobs` VALUES (70, 'Kho vận - Vật tư', 1);
INSERT INTO `jobs` VALUES (71, 'Khác', 1);
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
INSERT INTO `menus` VALUES (64, 'Quản Lý Bài Viết', '/posts', 'cil-puzzle', 'link', NULL, 1, 2);
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
INSERT INTO `posts` VALUES (1, 'TP HCM sau 20 ngày siết chặt', 'Qua 20 ngày siết chặt giãn cách xã hội, TP HCM ghi nhận biểu đồ ca nhiễm mới đi ngang nhưng vấn đề thành phố quan tâm nhất hiện nay là con số tử vong.', '<p class=\"description\">Qua 20 ngày siết chặt giãn cách xã hội, TP HCM ghi nhận biểu đồ ca nhiễm mới đi ngang nhưng vấn đề thành phố quan tâm nhất hiện nay là con số tử vong.</p>\n<article class=\"fck_detail \">\n<p class=\"Normal\">\"Dịch vẫn phức tạp vì đã thấm sâu trong cộng đồng, số ca nhiễm gần đây có xu hướng giảm, đi ngang nhưng chưa bền vững\", Phó chủ tịch UBND thành phố Dương Anh Đức nói, khi đánh giá về công tác phòng chống Covid-19 trên địa bàn.</p>\n<p class=\"Normal\">TP HCM những ngày qua đang áp dụng biện pháp mạnh nhất kể từ khi dịch xuất hiện. Người dân đã trải qua 37 ngày giãn cách xã hội theo Chỉ thị 16, trong đó, thành phố có 20 ngày áp dụng thêm các biện pháp tăng cường như <a href=\"https://vnexpress.net/tp-hcm-yeu-cau-nguoi-dan-khong-ra-duong-sau-18h-4330354.html\" rel=\"dofollow\">cấm ra đường</a>, ngưng các hoạt động không thiết yếu sau 18h...</p>\n<p class=\"Normal\">Khoảng thời gian này, số ca F0 mới mỗi ngày trên địa bàn không còn \"đột biến\" ở mức 5.000-6.000 ca như trước đó mà duy trì con số gần 4.000, phần lớn trong các khu phong tỏa. Chẳng hạn, một tuần gần nhất từ 5/8, trung bình mỗi ngày, thành phố ghi nhận 3.687 ca nhiễm, trong đó 78,6% ở khu phong tỏa, 2,3% trong khu cách ly, 17,7% qua sàng lọc tại bệnh viện.</p>\n</article>', 1, '2021-08-14 16:04:00', '2021-08-14 06:56:26', 1, '2021-08-14 07:18:35', 1);
INSERT INTO `posts` VALUES (3, 'demo', 'demo', '<p>demo</p>', 0, NULL, '2021-08-14 07:45:58', 1, NULL, NULL);
INSERT INTO `posts` VALUES (4, 'Ai được ra đường khi Đà Nẵng \'dừng hoạt động 7 ngày\'?', 'Chiều 14/8, Chủ tịch TP Đà Nẵng Lê Trung Chinh quy định những người được phép ra đường từ 8h ngày 16 đến 8h ngày 23/8. Đó là người thực hiện nhiệm vụ phòng, chống dịch Covid-19; người vận chuyển, cung ứng dược phẩm, vật tư y tế, hóa chất cho cơ sở y tế; phân phối lương thực, thực phẩm và hàng thiết yếu', '<p class=\"description\">Người làm nhiệm vụ phòng chống Covid-19, đảm bảo phục vụ nhu cầu thiết yếu cho người dân được phép ra đường, theo quyết định của UBND TP Đà Nẵng.</p>\n<article class=\"fck_detail \">\n<p class=\"Normal\">Chiều 14/8, Chủ tịch TP Đà Nẵng Lê Trung Chinh quy định những người được phép ra đường từ 8h ngày 16 đến 8h ngày 23/8. Đó là người thực hiện nhiệm vụ phòng, chống dịch Covid-19; người vận chuyển, cung ứng dược phẩm, vật tư y tế, hóa chất cho cơ sở y tế; phân phối lương thực, thực phẩm và hàng thiết yếu cho người dân; giao nhận hàng hóa xuất nhập khẩu từ cảng đến điểm giao hàng và ngược lại; vận chuyển công vụ; bưu chính nhà nước; công nhân vệ sinh môi trường, chăm sóc cây xanh đô thị, xử lý sự cố điện, nước, thông tin, viễn thông.</p>\n<p class=\"Normal\">Ngoài ra, còn có người đi cấp cứu; khám, chữa bệnh định kỳ tại cơ sở y tế trên địa bàn; đi xét nghiệm hoặc tiêm chủng Covid-19; người đi cách ly hoặc hoàn thành thời gian cách ly tập trung trở về nhà; người xuất viện; người đến cảng hàng không quốc tế để thực hiện chuyến bay đi nước ngoài khi đã có vé.</p>\n<p class=\"Normal\">Phóng viên được ra đường tác nghiệp báo chí, nhưng phải đảm bảo tối đa không quá 6 người/đơn vị phát thanh, truyền hình; không quá 2 người với báo in, báo điện tử (trừ các loại hình tạp chí).</p>\n<p class=\"Normal\"><strong>Những người đến nơi làm việc, sản xuất phải đảm bảo \"3 tại chỗ\" (làm việc, ăn uống, nghỉ ngơi tại chỗ) và được xem là một điểm cách ly, </strong>bao gồm: Người đến làm việc tại cơ quan, công sở nhà nước (không quá 10%); trung tâm thương mại, siêu thị, chuỗi cửa hàng tiện lợi (siêu thị mini), công ty thương mại đầu mối; nhà thuốc/quầy thuốc; cơ sở y tế trong và ngoài công lập; cơ sở cách ly y tế tập trung.</p>\n<p class=\"Normal\">Thêm vào đó còn có người đến làm việc tại các cơ sở cung cấp gas, cấp điện, cấp nước, xăng dầu; ngân hàng; bưu chính, viễn thông; cảng hàng không, cảng biển, nhà ga đường sắt, trạm quản lý đường bộ; cơ sở sản xuất suất ăn công nghiệp; làm việc tại các cơ sở sản xuất trong khu công nghiệp và khu công nghệ cao (chỉ được bố trí tối đa 30% số người làm việc).</p>\n<figure class=\"tplCaption action_thumb_added\" data-size=\"true\">\n<div class=\"fig-picture\"><picture><source srcset=\"https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NA2c0-P8MSMeTSRiomesCg 1x, https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=TeW4FiutyjMZoIdlUaFL4A 1.5x, https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=Gs3F2JXfPJ08iTQHKKppMA 2x\" data-srcset=\"https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NA2c0-P8MSMeTSRiomesCg 1x, https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=TeW4FiutyjMZoIdlUaFL4A 1.5x, https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=Gs3F2JXfPJ08iTQHKKppMA 2x\" /><img class=\"lazy lazied\" src=\"https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NA2c0-P8MSMeTSRiomesCg\" alt=\"Người dân lưu thông qua cầu Rồng, lúc 7h sáng 14/8. Ảnh: Nguyễn Đông.\" loading=\"lazy\" data-src=\"https://i1-vnexpress.vnecdn.net/2021/08/14/14-5531-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NA2c0-P8MSMeTSRiomesCg\" data-ll-status=\"loaded\" /></picture></div>\n<figcaption>\n<p class=\"Image\">Người dân lưu thông qua cầu Rồng lúc 7h sáng 14/8. Ảnh:<em> Nguyễn Đông.</em></p>\n</figcaption>\n</figure>\n<p class=\"Normal\">Những trường hợp ra đường trong hoạt động khẩn cấp khác phải được Chủ tịch UBND thành phố hoặc các quận, huyện quyết định. Các cơ quan, đơn vị, cơ sở sản xuất, kinh doanh, dịch vụ phải có lãnh đạo, nhân viên trực theo nguyên tắc \"3 tại chỗ\" để đảm bảo an ninh, an toàn phòng, chống cháy nổ.</p>\n<p class=\"Normal\">Giám đốc Công an thành phố và Trưởng công an các quận, huyện được giao hướng dẫn, cấp thẻ nhận diện đối với người được phép ra ngoài và tham gia giao thông; điều phối lực lượng kiểm tra, xử lý trường hợp vi phạm.</p>\n<p class=\"Normal\">Trong 7 ngày thành phố tạm dừng hoạt động, Sở Y tế Đà Nẵng lấy mẫu xét nghiệm cho toàn bộ người dân ở khu đang phong tỏa (39.550 người); đại diện hộ gia đình ở khu vực còn lại trên địa bàn (khoảng 219.740 người). \"Thành phố sẽ xét nghiệm toàn diện, không bỏ sót bất cứ hộ gia đình nào để quyết tâm đưa tất cả F0 ra khỏi cộng đồng\", Giám đốc Sở Y tế Đà Nẵng Ngô Thị Kim Yến nói.</p>\n<p class=\"Normal\">Theo bà Yến, năng lực điều trị bệnh nhân Covid-19 ở Đà Nẵng hiện nay có thể đáp ứng được 6.000 giường bệnh, trong đó chỉ 300 giường hồi sức tích cực có đầy đủ trang thiết bị y tế. Thành phố phải áp dụng biện pháp không để người dân ra đường trong 7 ngày nhằm kiểm soát dịch bệnh và \"không để hệ thống y tế bị quá tải như một số tỉnh phía Nam\".</p>\n<figure class=\"tplCaption action_thumb_added\" data-size=\"true\">\n<div class=\"fig-picture\"><picture><source srcset=\"https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=jTH0PmJh9CGmBUHSKT4_hw 1x, https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=PT9Fu1nQoPg9cbu9vtz0YA 1.5x, https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=pLZ_LBaSDCfs0WRtd5Fuqw 2x\" data-srcset=\"https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=jTH0PmJh9CGmBUHSKT4_hw 1x, https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=1020&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=PT9Fu1nQoPg9cbu9vtz0YA 1.5x, https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=2&amp;fit=crop&amp;s=pLZ_LBaSDCfs0WRtd5Fuqw 2x\" /><img class=\"lazy lazied\" src=\"https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=jTH0PmJh9CGmBUHSKT4_hw\" alt=\"Người lớn tuổi ở khu vực đang phong toả ở phường Mân Thái (quận Sơn Trà), được tiêm vaccine, chiều 14/8. Ảnh: Nguyễn Quang.\" loading=\"lazy\" data-src=\"https://i1-vnexpress.vnecdn.net/2021/08/14/a-6689-1628943869.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=jTH0PmJh9CGmBUHSKT4_hw\" data-ll-status=\"loaded\" /></picture></div>\n<figcaption>\n<p class=\"Image\">Người lớn tuổi ở khu vực đang phong tỏa ở phường Mân Thái (quận Sơn Trà), được tiêm vaccine, chiều 14/8. Ảnh: <em>Nguyễn Quang.</em></p>\n</figcaption>\n</figure>\n<p class=\"Normal\">Người lao động làm việc tại doanh nghiệp tổ chức làm việc theo phương án \"3 tại chỗ\" sẽ lấy mẫu xét nghiệm tần suất 3 ngày/lần, chi phí do doanh nghiệp chi trả. Người dân trong vùng phong tỏa cũng lấy mẫu 3 ngày/lần.</p>\n<p class=\"Normal\">Hôm nay, Đà Nẵng ghi nhận thêm 91 người mắc Covid-19 (23 người được cách ly tập trung từ trước), nâng số ca từ ngày 10/7 đến nay lên 1.700. Chuỗi lây nhiễm \"nguy cơ rất cao\" liên quan chợ đầu mối Hòa Cường ghi nhận 87 bệnh nhân trong 3 ngày, đa số là tiểu thương.</p>\n</article>', 1, '2021-08-14 21:46:00', '2021-08-14 14:46:11', 12, NULL, NULL);
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
INSERT INTO `sources` VALUES (24, 'Trung tâm', 'Trung tâm', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (25, 'Vãng lai', 'Vãng lai', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (26, 'Marketing', 'Marketing', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (27, 'Sale Hub MB', 'Sale Hub MB', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (28, 'CTV', 'CTV', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (29, 'Giới thiệu', 'Giới thiệu', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (30, 'Khác', 'Khác', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (31, 'Sale Hub MN', 'Sale Hub MN', 1, NULL, '2018-03-22 04:40:07');
INSERT INTO `sources` VALUES (32, 'Phát triển đối tác', 'Phát triển đối tác', 1, NULL, '2020-09-19 11:22:28');
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
