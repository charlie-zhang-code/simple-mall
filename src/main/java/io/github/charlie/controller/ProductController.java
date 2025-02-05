package io.github.charlie.controller;

import io.github.charlie.base.IDs;
import io.github.charlie.base.Result;
import io.github.charlie.convert.ProductConvert;
import io.github.charlie.model.entity.Order;
import io.github.charlie.model.entity.Product;
import io.github.charlie.model.form.OrderForm;
import io.github.charlie.model.form.ProductForm;
import io.github.charlie.service.ProductService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * @Author: charlie-zhang-code
 * @Date: 2025/2/5
 * @Description: 商品控制器
 */
@Tag(name = "商品管理")
@RequestMapping("/api/v1/product")
@RestController
@RequiredArgsConstructor
public class ProductController {
    private final ProductService service;
    private final ProductConvert convert;

    @Operation(summary = "创建商品")
    @PostMapping
    public Result<Boolean> create(@RequestBody ProductForm form) {
        Product entity = convert.toEntity(form);
        entity.setId(null);
        boolean save = service.save(entity);
        return Result.status(save);
    }

    @Operation(summary = "删除商品")
    @DeleteMapping
    public Result<Boolean> delete(@RequestBody IDs iDs) {
        boolean remove = service.removeByIds(iDs.getIds());
        return Result.status(remove);
    }

    @Operation(summary = "修改商品")
    @PutMapping
    public Result<Boolean> update(@RequestBody ProductForm form) {
        Product entity = convert.toEntity(form);
        boolean update = service.updateById(entity);
        return Result.status(update);
    }

    @Operation(summary = "查询商品")
    @GetMapping("/{id}")
    public Result<Product> get(@PathVariable Long id) {
        Product entity = service.getById(id);
        return Result.success(entity);
    }
}
