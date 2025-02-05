package io.github.charlie.model.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
import lombok.Data;

/**
 * @TableName sys_specification
 */
@TableName(value ="sys_specification")
@Data
public class Specification implements Serializable {
    private Long id;

    private Long productId;

    private String name;

    private String code;

    private Integer stock;

    private BigDecimal price;

    private String description;

    private Integer status;

    private String remark;

    private Date createAt;

    private Long createBy;

    private Date updateAt;

    private Long updateBy;

    private static final long serialVersionUID = 1L;
}