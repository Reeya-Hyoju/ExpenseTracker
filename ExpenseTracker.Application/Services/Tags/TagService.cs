using ExpenseTracker.Application.Dtos.Tag;
using ExpenseTracker.Application.Interfaces;

namespace ExpenseTracker.Application.Services.Tags
{
    public class TagService : ITagService
    {
        private readonly IGenericRepository<Domain.Entities.Tags> _tagsRepository;
        public TagService(IGenericRepository<Domain.Entities.Tags> tagsRepository)
        {
            _tagsRepository = tagsRepository;
        }
        public async Task<Domain.Entities.Tags> CreateTagsAsync(CreateTagRequest request)
        {
            var tag = new Domain.Entities.Tags
            {
                Name = request.Name
            };
            await _tagsRepository.AddAsync(tag);
            await _tagsRepository.SaveChangesAsync();
            return tag;
        }
        public async Task<IEnumerable<Domain.Entities.Tags>> GetAllTagsAsync()
        {
            return await _tagsRepository.GetAllAsync();
        }
    }
}
