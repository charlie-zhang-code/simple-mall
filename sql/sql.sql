-- 创建数据库
CREATE DATABASE IF NOT EXISTS simple_mall;

-- 使用数据库
USE simple_mall;

-- ----------------------------
-- 用户表
-- ----------------------------
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user
(
    id        BIGINT AUTO_INCREMENT NOT NULL COMMENT '用户唯一标识符，主键',
    username  VARCHAR(64)           NOT NULL COMMENT '用户登录时使用的用户名',
    password  VARCHAR(100)          NOT NULL COMMENT '用户账户的密码，应存储加密后的值',
    nickname  VARCHAR(128) DEFAULT NULL COMMENT '用户在系统中显示的名字，可选',
    avatar    VARCHAR(255) DEFAULT NULL COMMENT '用户头像的URL或路径',
    gender    INT          DEFAULT 0 COMMENT '用户的性别，0表示保密，1表示男性，2表示女性',
    address   VARCHAR(128) DEFAULT NULL COMMENT '用户的地址',
    telephone VARCHAR(20)  DEFAULT NULL COMMENT '用户的联系电话，可用于身份验证或联系用户',
    -- 固定字段
    status    INT          DEFAULT 1 COMMENT '状态，0表示禁用，1表示正常启用',
    remark    VARCHAR(255) DEFAULT NULL COMMENT '对记录的备注信息，如特殊说明等',
    create_at TIMESTAMP    DEFAULT NULL COMMENT '记录创建的时间戳',
    create_by BIGINT       DEFAULT NULL COMMENT '创建该记录的用户标识符',
    update_at TIMESTAMP    DEFAULT NULL COMMENT '记录最后更新的时间戳',
    update_by BIGINT       DEFAULT NULL COMMENT '最后更新该记录的用户标识符',
    -- 添加索引
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '用户表';

-- 插入数据
INSERT INTO sys_user (id, username, password, nickname, avatar, gender, address, telephone)
VALUES (1, 'admin', '$2a$10$DFzidaYUGmL2dEjlB49s../ifkTKnyO6aCv0eiTMnQjMyZ.TXOLn6', '管理员',
        'https://c-ssl.dtstatic.com/uploads/blog/202304/15/20230415081411_9a88c.thumb.400_0.jpg',
        0, '地球村中国', 'admin@example.com'),
       (2, 'user', '$2a$10$DFzidaYUGmL2dEjlB49s../ifkTKnyO6aCv0eiTMnQjMyZ.TXOLn6', '管理员',
        'https://c-ssl.dtstatic.com/uploads/blog/202304/15/20230415081411_9a88c.thumb.400_0.jpg',
        0, '地球村中国', 'admin@example.com');

-- ----------------------------
-- 角色表
-- ----------------------------
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role
(
    id        BIGINT AUTO_INCREMENT NOT NULL COMMENT '唯一标识符，主键',
    name      VARCHAR(255) DEFAULT NULL COMMENT '角色名称',
    code      VARCHAR(255) DEFAULT NULL COMMENT '角色编码',
    -- 固定字段
    status    INT          DEFAULT 1 COMMENT '状态，0表示禁用，1表示正常启用',
    remark    VARCHAR(255) DEFAULT NULL COMMENT '对记录的备注信息，如特殊说明等',
    create_at TIMESTAMP    DEFAULT NULL COMMENT '记录创建的时间戳',
    create_by BIGINT       DEFAULT NULL COMMENT '创建该记录的用户标识符',
    update_at TIMESTAMP    DEFAULT NULL COMMENT '记录最后更新的时间戳',
    update_by BIGINT       DEFAULT NULL COMMENT '最后更新该记录的用户标识符',
    -- 添加索引
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '角色表';

-- 插入数据
INSERT INTO sys_role (id, name, code)
VALUES (1, '管理员', 'admin'),
       (2, '普通用户', 'user');

-- ----------------------------
-- 用户-角色关联表 1-N
-- ----------------------------
DROP TABLE IF EXISTS sys_user_role;
CREATE TABLE sys_user_role
(
    user_id BIGINT NOT NULL COMMENT '用户ID',
    role_id BIGINT NOT NULL COMMENT '角色ID',
    PRIMARY KEY (user_id, role_id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '用户-角色关联表';

-- 插入数据
INSERT INTO sys_user_role (user_id, role_id)
VALUES (1, 1),
       (2, 2);

-- ----------------------------
-- 商品表
-- ----------------------------
DROP TABLE IF EXISTS sys_product;
CREATE TABLE sys_product
(
    id          BIGINT AUTO_INCREMENT NOT NULL COMMENT '唯一标识符，主键',
    category_id BIGINT                NOT NULL COMMENT '类别ID',
    brand       VARCHAR(255) DEFAULT NULL COMMENT '商品品牌',
    img         VARCHAR(255) DEFAULT NULL COMMENT '商品图片的URL或路径',
    name        VARCHAR(255) DEFAULT NULL COMMENT '商品名称',
    sales       INT          DEFAULT 0 COMMENT '商品销量',
    description VARCHAR(255) DEFAULT NULL COMMENT '商品描述',
    -- 固定字段
    status      INT          DEFAULT 1 COMMENT '状态，0表示禁用，1表示正常启用',
    remark      VARCHAR(255) DEFAULT NULL COMMENT '对记录的备注信息，如特殊说明等',
    create_at   TIMESTAMP    DEFAULT NULL COMMENT '记录创建的时间戳',
    create_by   BIGINT       DEFAULT NULL COMMENT '创建该记录的用户标识符',
    update_at   TIMESTAMP    DEFAULT NULL COMMENT '记录最后更新的时间戳',
    update_by   BIGINT       DEFAULT NULL COMMENT '最后更新该记录的用户标识符',
    -- 添加索引
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '商品表';

-- 插入数据
INSERT INTO sys_product (id, category_id, img, name, description)
VALUES (1, 1, 'https://c-ssl.dtstatic.com/uploads/blog/202304/15/20230415081411_9a88c.thumb.400_0.jpg', '手机', '商品描述1'),
       (2, 2, 'https://c-ssl.dtstatic.com/uploads/blog/202304/15/20230415081411_9a88c.thumb.400_0.jpg', '电脑', '商品描述2');

-- ----------------------------
-- 商品类别表
-- ----------------------------
DROP TABLE IF EXISTS sys_category;
CREATE TABLE sys_category
(
    id        BIGINT AUTO_INCREMENT NOT NULL COMMENT '唯一标识符，主键',
    name      VARCHAR(255) DEFAULT NULL COMMENT '类别名称',
    code      VARCHAR(255) DEFAULT NULL COMMENT '类别编码',
    -- 固定字段
    status    INT          DEFAULT 1 COMMENT '状态，0表示禁用，1表示正常启用',
    remark    VARCHAR(255) DEFAULT NULL COMMENT '对记录的备注信息，如特殊说明等',
    create_at TIMESTAMP    DEFAULT NULL COMMENT '记录创建的时间戳',
    create_by BIGINT       DEFAULT NULL COMMENT '创建该记录的用户标识符',
    update_at TIMESTAMP    DEFAULT NULL COMMENT '记录最后更新的时间戳',
    update_by BIGINT       DEFAULT NULL COMMENT '最后更新该记录的用户标识符',
    -- 添加索引
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '商品类别表';

-- 插入数据
INSERT INTO sys_category (id, name, code)
VALUES (1, '手机', 'PHN'),
       (2, '电脑', 'CMPTR'),
       (3, '平板', 'TBLT'),
       (4, '家用电器', 'HMEAPLNC'),
       (5, '家具', 'FRNTR'),
       (6, '书籍', 'BKS'),
       (7, '运动用品', 'SPRTSGDS'),
       (8, '美妆护肤', 'BNFTHCARE'),
       (9, '食品饮料', 'FDNDRNK'),
       (10, '服装', 'CLTHNG'),
       (11, '鞋靴', 'SHZ'),
       (12, '珠宝首饰', 'JWLRY'),
       (13, '汽车配件', 'CRRPRTS'),
       (14, '玩具', 'TOYS'),
       (15, '乐器', 'MUSINSTR');

-- ----------------------------
-- 规格表
-- ----------------------------
DROP TABLE IF EXISTS sys_specification;
CREATE TABLE sys_specification
(
    id          BIGINT AUTO_INCREMENT NOT NULL COMMENT '唯一标识符，主键',
    product_id  BIGINT                NOT NULL COMMENT '商品ID',
    name        VARCHAR(255)   DEFAULT NULL COMMENT '规格名称',
    code        VARCHAR(255)   DEFAULT NULL COMMENT '规格编码',
    stock       INT            DEFAULT 0 COMMENT '商品库存数量',
    price       DECIMAL(10, 2) DEFAULT 0.00 COMMENT '商品价格，精确到小数点后两位',
    description VARCHAR(255)   DEFAULT NULL COMMENT '规格描述',
    -- 固定字段
    status      INT            DEFAULT 1 COMMENT '状态，0表示禁用，1表示正常启用',
    remark      VARCHAR(255)   DEFAULT NULL COMMENT '对记录的备注信息，如特殊说明等',
    create_at   TIMESTAMP      DEFAULT NULL COMMENT '记录创建的时间戳',
    create_by   BIGINT         DEFAULT NULL COMMENT '创建该记录的用户标识符',
    update_at   TIMESTAMP      DEFAULT NULL COMMENT '记录最后更新的时间戳',
    update_by   BIGINT         DEFAULT NULL COMMENT '最后更新该记录的用户标识符',
    -- 添加索引
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '规格表';

-- 插入数据
INSERT INTO sys_specification (product_id, name, code, stock, price, description, status, remark, create_at, create_by,
                               update_at, update_by)
VALUES (1, '红色小号', 'SPEC0001', 200, 19.99, '红色，适合小尺寸需求', 1, '首次添加', '2025-01-01 10:00:00', 1,
        '2025-01-01 10:00:00', 1),
       (2, '蓝色中号', 'SPEC0002', 150, 24.99, '蓝色，适用于中等尺寸', 1, NULL, '2025-01-02 11:00:00', 2,
        '2025-01-03 15:00:00', 2);

-- ----------------------------
-- 订单表
-- ----------------------------
DROP TABLE IF EXISTS sys_order;
CREATE TABLE sys_order
(
    id               BIGINT AUTO_INCREMENT NOT NULL COMMENT '唯一标识符，主键',
    product_id       BIGINT                NOT NULL COMMENT '商品ID',
    specification_id BIGINT                NOT NULL COMMENT '规格ID',
    quantity         INT                   NOT NULL COMMENT '购买数量',
    price            DECIMAL(10, 2)        NOT NULL COMMENT '商品价格，精确到小数点后两位',
    total_price      DECIMAL(10, 2)        NOT NULL COMMENT '订单总金额，精确到小数点后两位',
    state            INT                   NOT NULL COMMENT '订单状态，0表示待付款，1表示待发货，2表示待收货，3表示已完成，4表示已取消',
    payment_method   INT                   NOT NULL COMMENT '支付方式，0表示支付宝，1表示微信，2表示货到付款',
    payment_time     TIMESTAMP    DEFAULT NULL COMMENT '支付时间',
    delivery_time    TIMESTAMP    DEFAULT NULL COMMENT '发货时间',
    receive_time     TIMESTAMP    DEFAULT NULL COMMENT '收货时间',
    comment_state    INT                   NOT NULL COMMENT '评论状态，0表示未评论，1表示已评论',
    score_state      INT                   NOT NULL COMMENT '评分状态，0表示未评分，1表示已评分',
    -- 固定字段
    status           INT          DEFAULT 1 COMMENT '状态，0表示禁用，1表示正常启用',
    remark           VARCHAR(255) DEFAULT NULL COMMENT '对记录的备注信息，如特殊说明等',
    create_at        TIMESTAMP    DEFAULT NULL COMMENT '记录创建的时间戳',
    create_by        BIGINT       DEFAULT NULL COMMENT '创建该记录的用户标识符',
    update_at        TIMESTAMP    DEFAULT NULL COMMENT '记录最后更新的时间戳',
    update_by        BIGINT       DEFAULT NULL COMMENT '最后更新该记录的用户标识符',
    -- 添加索引
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '评论表';

-- ----------------------------
-- 评论表
-- ----------------------------
DROP TABLE IF EXISTS sys_comment;
CREATE TABLE sys_comment
(
    id               BIGINT AUTO_INCREMENT NOT NULL COMMENT '唯一标识符，主键',
    order_id         BIGINT                NOT NULL COMMENT '订单ID',
    product_id       BIGINT                NOT NULL COMMENT '商品ID',
    specification_id BIGINT                NOT NULL COMMENT '规格ID',
    content          VARCHAR(255)          NOT NULL COMMENT '评论内容',
    score            INT                   NOT NULL COMMENT '评分，1-5分',
    -- 固定字段
    status           INT          DEFAULT 1 COMMENT '状态，0表示禁用，1表示正常启用',
    remark           VARCHAR(255) DEFAULT NULL COMMENT '对记录的备注信息，如特殊说明等',
    create_at        TIMESTAMP    DEFAULT NULL COMMENT '记录创建的时间戳',
    create_by        BIGINT       DEFAULT NULL COMMENT '创建该记录的用户标识符',
    update_at        TIMESTAMP    DEFAULT NULL COMMENT '记录最后更新的时间戳',
    update_by        BIGINT       DEFAULT NULL COMMENT '最后更新该记录的用户标识符',
    -- 添加索引
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '评论表';

-- ----------------------------
-- 提问表
-- ----------------------------
DROP TABLE IF EXISTS sys_question;
CREATE TABLE sys_question
(
    id               BIGINT AUTO_INCREMENT NOT NULL COMMENT '唯一标识符，主键',
    product_id       BIGINT                NOT NULL COMMENT '商品ID',
    specification_id BIGINT                NOT NULL COMMENT '规格ID',
    parent_id        BIGINT                NOT NULL COMMENT '父级提问ID，0表示一级提问',
    title            VARCHAR(255)          NOT NULL COMMENT '提问标题',
    content          VARCHAR(255)          NOT NULL COMMENT '提问内容',
    state            INT                   NOT NULL COMMENT '状态，0表示未回复，1表示已回复',
    -- 固定字段
    status           INT          DEFAULT 1 COMMENT '状态，0表示禁用，1表示正常启用',
    remark           VARCHAR(255) DEFAULT NULL COMMENT '对记录的备注信息，如特殊说明等',
    create_at        TIMESTAMP    DEFAULT NULL COMMENT '记录创建的时间戳',
    create_by        BIGINT       DEFAULT NULL COMMENT '创建该记录的用户标识符',
    update_at        TIMESTAMP    DEFAULT NULL COMMENT '记录最后更新的时间戳',
    update_by        BIGINT       DEFAULT NULL COMMENT '最后更新该记录的用户标识符',
    -- 添加索引
    PRIMARY KEY (id)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_unicode_ci
    COMMENT '提问表';