package io.github.charlie.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.github.charlie.base.BaseEntity;
import java.io.Serializable;
import lombok.Data;

/**
 * @TableName sys_product
 */
@TableName(value ="sys_product")
@Data
public class Product extends BaseEntity implements Serializable {
    private Long id;

    private Long categoryId;

    private String brand;

    private String img;

    private String name;

    private Integer sales;

    private String description;

    private static final long serialVersionUID = 1L;
}