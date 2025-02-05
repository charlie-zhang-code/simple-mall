package io.github.charlie.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;
import lombok.Data;

/**
 * @TableName sys_role
 */
@TableName(value ="sys_role")
@Data
public class Role implements Serializable {
    private Long id;

    private String name;

    private String code;

    private Integer status;

    private String remark;

    private Date createAt;

    private Long createBy;

    private Date updateAt;

    private Long updateBy;

    private static final long serialVersionUID = 1L;
}