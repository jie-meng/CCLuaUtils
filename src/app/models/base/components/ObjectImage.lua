local ObjectImage = class('ObjectImage')

function ObjectImage:ctor(image, row_col_count, index, scale, hflip, vflip)
    self.image_ = image
    self.row_col_count_ = row_col_count     -- if row_col_count is cc.p(4, 4), that is a big image with 4 * 4 sub images, if nil then it is a single image
    self.index_ = index  -- if index is cc.p(0, 1), pick sub image in row 0, col 1, if nil then select the whole image
    self.scale_ = scale or cc.p(1, 1)
    self.hflip_ =  hflip or false
    self.vflip_ = vflip or false
end

function ObjectImage:getImage()
    return self.image_
end

function ObjectImage:getRowColCount()
    return self.row_col_count_
end

function ObjectImage:getIndex()
    return self.index_
end

function ObjectImage:getScale()
    return self.scale_
end

function ObjectImage:isHflip()
    return self.hflip_
end

function ObjectImage:isVFlip()
    return self.vflip_
end

return ObjectImage
