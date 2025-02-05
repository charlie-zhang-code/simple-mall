package io.github.charlie.convert;

import io.github.charlie.model.entity.Product;
import io.github.charlie.model.form.ProductForm;
import org.mapstruct.Mapper;
import org.mapstruct.MappingConstants;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 商品转换器
 */
@Mapper(componentModel = MappingConstants.ComponentModel.SPRING)
public interface ProductConvert {
    Product toEntity(ProductForm form);
}
