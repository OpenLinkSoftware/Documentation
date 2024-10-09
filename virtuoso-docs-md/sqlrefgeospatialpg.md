<div>

<div>

<div>

<div>

### 9.34.3. Precision of Geometries

</div>

</div>

</div>

The internal precision of geometry operations is 64 bit IEEE floating
point. Normally, a geometry index for geography uses can be made with 32
bit floats for space efficiency, as these still give a precision of
about 2 meters on the surface of the Earth. A geometry object is stored
with all coordinates either as float or double depending on which data
type was supplied in creating the object. Note that the object itself
can have more precise coordinates than the representation of its
bounding box in the R tree index.

Bounding boxes for shapes can be calculated approximately as soon as
shape contain any arcs. In any case, bounding box of a shape is a bit
bigger than the shape itself in order to tolerate rounding errors.
Predicates for spatial relations accept an additional, non-standard,
argument for tolerance. If the tolerance is greater than zero, borders
of shapes are treated as wide lines with thickness is approximately
equal to the specified tolerance. That is useful for dealing with
inaccurate data such as amateur GPS/GLONASS tracks, coordinates rounded
to minutes when published in Dbpedia and the like.

</div>
