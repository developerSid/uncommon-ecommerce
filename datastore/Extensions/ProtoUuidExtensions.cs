using Uncommon.Ecommerce.EventStream.Lib;

namespace datastore.Extensions;

public static class ProtoUuidExtensions
{
    public static Guid ToGuid(this UUID uuid)
    {
        return Guid.Parse(uuid.Value);
    }

    public static UUID ToUuid(this Guid guid)
    {
        return new UUID()
        {
            Value = guid.ToString("D")
        };
    }
}