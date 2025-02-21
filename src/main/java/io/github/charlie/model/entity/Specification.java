package io.github.charlie.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import io.github.charlie.base.BaseEntity;
import java.io.Serializable;
import java.math.BigDecimal;
import lombok.Data;

/**
 * @TableName sys_specification
 */
@TableName(value ="sys_specification")
@Data
public class Specification extends BaseEntity implements Serializable {
    private Long id;

    private Long productId;

    private String name;

    private String code;

    private Integer stock;

    private BigDecimal price;

    private String description;

    private static final long serialVersionUID = 1L;
}