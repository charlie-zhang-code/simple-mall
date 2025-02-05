package io.github.charlie.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName sys_user
 */
@TableName(value ="sys_user")
@Data
public class User implements Serializable {
    private Long id;

    private String username;

    private String password;

    private String nickname;

    private String avatar;

    private Integer gender;

    private String address;

    private String telephone;

    private Integer status;

    private String remark;

    private Date createAt;

    private Long createBy;

    private Date updateAt;

    private Long updateBy;

    private static final long serialVersionUID = 1L;
}