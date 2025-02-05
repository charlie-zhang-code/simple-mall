package io.github.charlie.model.form;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 商品表单
 */
@Data
public class ProductForm implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long categoryId;

    private String brand;

    private String img;

    private String name;

    private Integer sales;

    private String description;
}
