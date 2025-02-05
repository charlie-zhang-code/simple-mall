package io.github.charlie.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.github.charlie.base.BaseEntity;
import java.io.Serializable;
import lombok.Data;

/**
 * @TableName sys_category
 */
@TableName(value ="sys_category")
@Data
public class Category extends BaseEntity implements Serializable {
    private Long id;

    private String name;

    private String code;

    private static final long serialVersionUID = 1L;
}