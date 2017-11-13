local ObjectAnimation = class('ObjectAnimation')

function ObjectAnimation:ctor(image, row_col_count, indexes, scale, hflip, vflip)
    self.image_ = image
    self.row_col_count_ = row_col_count or cc.p(4, 4)     -- a big image with 4 * 4 sub images
    self.indexes_ = indexes or { cc.p(0, 0), cc.p(0, 1) }     -- pick sub images in row 0, col 0 and row 0, col 1 as an animation
    self.scale_ = scale or cc.p(1, 1)
    self.hflip_ =  hflip or false
    self.vflip_ = vflip or false
end

function ObjectAnimation:getImage()
    return self.image_
end

function ObjectAnimation:getRowColCount()
    return self.row_col_count_
end

function ObjectAnimation:getIndex()
    return self.indexes_
end

function ObjectAnimation:getScale()
    return self.scale_
end

function ObjectAnimation:isHflip()
    return self.hflip_
end

function ObjectAnimation:isVFlip()
    return self.vflip_
end

return ObjectAnimation
