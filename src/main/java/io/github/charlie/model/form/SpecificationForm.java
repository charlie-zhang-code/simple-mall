package io.github.charlie.model.form;

import lombok.Data;

import java.io.Serial;
import java.io.Serializable;
import java.math.BigDecimal;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 规格表单
 */
@Data
public class SpecificationForm implements Serializable {
    @Serial
    private static final long serialVersionUID = 1L;

    private Long id;

    private Long productId;

    private String name;

    private String code;

    private Integer stock;

    private BigDecimal price;

    private String description;
}
