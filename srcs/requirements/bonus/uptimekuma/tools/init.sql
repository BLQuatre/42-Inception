INSERT OR IGNORE INTO `user` (`username`, `password`)
VALUES
('${UPKUMA_USER}', '${CRYPTED_UPKUMA_PASSWORD}');

INSERT OR IGNORE INTO `docker_host` (`id`, `user_id`, `docker_daemon`, `docker_type`, `name`)
VALUES
(1, 1, '/var/run/docker.sock', 'socket', 'Inception');

INSERT OR IGNORE INTO `monitor` (`id`, `name`, `user_id`, `url`, `type`, `dns_resolve_type`, `dns_resolve_server`, `retry_interval`, `docker_host`, `docker_container`, `expiry_notification`, `mqtt_topic`, `mqtt_success_message`, `mqtt_username`, `mqtt_password`, `kafka_producer_brokers`, `kafka_producer_sasl_options`, `oauth_auth_method`)
VALUES
(1, 'Wordpress', 1, 'https://', 'docker', 'A', '1.1.1.1', 20, 1, 'wordpress', 0, '', '', '', '', '[]', '{"mechanism":"None"}', 'client_secret_basic'),
(2, 'Redis Cache', 1, 'https://', 'docker', 'A', '1.1.1.1', 20, 1, 'redis', 0, '', '', '', '', '[]', '{"mechanism":"None"}', 'client_secret_basic'),
(3, 'Portfolio', 1, 'https://', 'docker', 'A', '1.1.1.1', 20, 1, 'portfolio', 0, '', '', '', '', '[]', '{"mechanism":"None"}', 'client_secret_basic'),
(4, 'Nginx', 1, 'https://', 'docker', 'A', '1.1.1.1', 20, 1, 'nginx', 0, '', '', '', '', '[]', '{"mechanism":"None"}', 'client_secret_basic'),
(5, 'Uptime Kuma', 1, 'https://', 'docker', 'A', '1.1.1.1', 20, 1, 'uptimekuma', 0, '', '', '', '', '[]', '{"mechanism":"None"}', 'client_secret_basic'),
(6, 'FTP', 1, 'https://', 'docker', 'A', '1.1.1.1', 20, 1, 'ftp', 0, '', '', '', '', '[]', '{"mechanism":"None"}', 'client_secret_basic'),
(7, 'MariaDB', 1, 'https://', 'docker', 'A', '1.1.1.1', 20, 1, 'mariadb', 0, '', '', '', '', '[]', '{"mechanism":"None"}', 'client_secret_basic'),
(8, 'Adminer', 1, 'https://', 'docker', 'A', '1.1.1.1', 20, 1, 'adminer', 0, '', '', '', '', '[]', '{"mechanism":"None"}', 'client_secret_basic');


INSERT OR IGNORE INTO `status_page` (`id`, `slug`, `title`, `icon`, `theme`, `footer_text`, `custom_css`, `show_powered_by`)
VALUES
(1, 'inception', 'Inception', '/icon.svg', 'auto', '', replace('body {\n	\n}\n', '\n', char(10)), 0);

INSERT OR IGNORE INTO `group` (`id`, `name`, `public`, `weight`, `status_page_id`)
VALUES
(1, 'Website', 1, 1, 1),
(2, 'Server', 1, 2, 1),
(3, 'Database', 1, 3, 1);

INSERT OR IGNORE INTO `monitor_group` (`id`, `monitor_id`, `group_id`, `weight`)
VALUES
(1, 1, 1, 1),
(2, 2, 1, 2),
(3, 3, 1, 3),
(4, 4, 2, 1),
(5, 5, 2, 2),
(6, 6, 2, 3),
(7, 7, 3, 1),
(8, 8, 3, 2);
